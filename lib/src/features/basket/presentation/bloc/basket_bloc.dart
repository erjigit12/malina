import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina/src/features/auth/domain/usecases/get_current_user.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/domain/usecases/add_basket_item.dart';
import 'package:malina/src/features/basket/domain/usecases/clear_basket.dart';
import 'package:malina/src/features/basket/domain/usecases/clear_category.dart';
import 'package:malina/src/features/basket/domain/usecases/load_basket_items.dart';
import 'package:malina/src/features/basket/domain/usecases/remove_basket_item.dart';
import 'package:malina/src/features/basket/domain/usecases/update_basket_items.dart';
import 'package:uuid/uuid.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc({
    required LoadBasketItems loadBasketItems,
    required AddBasketItem addBasketItem,
    required UpdateBasketItems updateBasketItems,
    required RemoveBasketItem removeBasketItem,
    required ClearBasket clearBasket,
    required ClearCategory clearCategory,
    required GetCurrentUser getCurrentUser,
  })  : _loadBasketItems = loadBasketItems,
        _addBasketItem = addBasketItem,
        _updateBasketItems = updateBasketItems,
        _removeBasketItem = removeBasketItem,
        _clearBasket = clearBasket,
        _clearCategory = clearCategory,
        _getCurrentUser = getCurrentUser,
        super(const BasketState()) {
    on<BasketStarted>(_onStarted);
    on<BasketCategorySelected>(_onCategorySelected);
    on<BasketItemAdded>(_onItemAdded);
    on<BasketItemQuantityChanged>(_onItemQuantityChanged);
    on<BasketItemRemoved>(_onItemRemoved);
    on<BasketCleared>(_onBasketCleared);
    on<BasketCategoryCleared>(_onCategoryCleared);
    on<BasketItemUpdated>(_onItemUpdated);
    on<BasketSubcategoryCleared>(_onSubcategoryCleared);
    on<BasketUserChanged>(_onUserChanged);
  }

  final LoadBasketItems _loadBasketItems;
  final AddBasketItem _addBasketItem;
  final UpdateBasketItems _updateBasketItems;
  final RemoveBasketItem _removeBasketItem;
  final ClearBasket _clearBasket;
  final ClearCategory _clearCategory;
  final GetCurrentUser _getCurrentUser;

  final _uuid = const Uuid();
  String? _userId;
  Timer? _debounceTimer;

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }

  Future<void> _ensureUser() async {
    if (_userId != null) return;
    final user = await _getCurrentUser();
    _userId = user?.email;
  }

  Future<void> _onStarted(BasketStarted event, Emitter<BasketState> emit) async {
    emit(const BasketState(isLoading: true));
    final user = await _getCurrentUser();
    _userId = user?.email;
    if (_userId == null) {
      emit(const BasketState(errorMessage: 'Пользователь не найден', items: []));
      return;
    }

    await _loadItemsForCurrentUser(emit, resetActiveCategory: true);
  }

  void _onCategorySelected(BasketCategorySelected event, Emitter<BasketState> emit) {
    emit(state.copyWith(activeCategory: event.category));
  }

  Future<void> _onItemAdded(BasketItemAdded event, Emitter<BasketState> emit) async {
    await _ensureUser();
    final userId = _userId;
    if (userId == null) return;

    final newItem = event.item.copyWith(
      id: _uuid.v4(),
      createdAt: DateTime.now(),
    );

    final updatedItems = List<BasketItemEntity>.from(state.items)..add(newItem);
    emit(state.copyWith(items: updatedItems, activeCategory: newItem.category));

    await _addBasketItem(userId: userId, item: newItem);
  }

  Future<void> _onItemQuantityChanged(
    BasketItemQuantityChanged event,
    Emitter<BasketState> emit,
  ) async {
    final updatedItems = state.items.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(quantity: event.quantity);
      }
      return item;
    }).where((item) => item.quantity > 0).toList();

    emit(state.copyWith(items: updatedItems));

    await _schedulePersist();
  }

  Future<void> _onItemUpdated(BasketItemUpdated event, Emitter<BasketState> emit) async {
    final updatedItems = state.items.map((item) {
      if (item.id == event.item.id) {
        return event.item;
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
    await _schedulePersist();
  }

  Future<void> _onItemRemoved(BasketItemRemoved event, Emitter<BasketState> emit) async {
    await _ensureUser();
    final userId = _userId;
    if (userId == null) return;

    final updatedItems = state.items.where((item) => item.id != event.itemId).toList();
    emit(state.copyWith(items: updatedItems));
    await _removeBasketItem(userId: userId, itemId: event.itemId);
  }

  Future<void> _onBasketCleared(BasketCleared event, Emitter<BasketState> emit) async {
    await _ensureUser();
    final userId = _userId;
    if (userId == null) return;

    emit(state.copyWith(items: const []));
    await _clearBasket(userId: userId);
  }

  Future<void> _onCategoryCleared(BasketCategoryCleared event, Emitter<BasketState> emit) async {
    await _ensureUser();
    final userId = _userId;
    if (userId == null) return;

    final updatedItems = state.items.where((item) => item.category != event.category).toList();
    emit(state.copyWith(items: updatedItems));
    await _clearCategory(userId: userId, category: event.category);
  }

  Future<void> _onSubcategoryCleared(
    BasketSubcategoryCleared event,
    Emitter<BasketState> emit,
  ) async {
    await _ensureUser();
    final userId = _userId;
    if (userId == null) return;

    final updatedItems = state.items
        .where(
          (item) =>
              item.category != event.category || item.subcategory != event.subcategory,
        )
        .toList();
    emit(state.copyWith(items: updatedItems));
    await _updateBasketItems(userId: userId, items: updatedItems);
  }

  Future<void> _onUserChanged(
    BasketUserChanged event,
    Emitter<BasketState> emit,
  ) async {
    _userId = event.email;
    if (_userId == null) {
      emit(const BasketState());
      return;
    }

    emit(const BasketState(isLoading: true));
    await _loadItemsForCurrentUser(emit, resetActiveCategory: true);
  }

  Future<void> _loadItemsForCurrentUser(
    Emitter<BasketState> emit, {
    required bool resetActiveCategory,
  }) async {
    final userId = _userId;
    if (userId == null) {
      emit(state.copyWith(isLoading: false, items: const [], errorMessage: 'Пользователь не найден'));
      return;
    }

    try {
      final items = await _loadBasketItems(userId);
      final categories = {
        ...BasketState.defaultCategories,
        ...items.map((item) => item.category),
      }.toList()
        ..sort();

      String activeCategory;
      if (resetActiveCategory) {
        activeCategory = categories.contains(BasketState.defaultActiveCategory)
            ? BasketState.defaultActiveCategory
            : (categories.isNotEmpty ? categories.first : BasketState.defaultActiveCategory);
      } else {
        activeCategory = categories.contains(state.activeCategory)
            ? state.activeCategory
            : (categories.contains(BasketState.defaultActiveCategory)
                ? BasketState.defaultActiveCategory
                : (categories.isNotEmpty ? categories.first : BasketState.defaultActiveCategory));
      }

      emit(
        state.copyWith(
          isLoading: false,
          items: items,
          activeCategory: activeCategory,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Не удалось загрузить корзину'));
    }
  }

  Future<void> _schedulePersist() async {
    await _ensureUser();
    final userId = _userId;
    if (userId == null) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      unawaited(
        _updateBasketItems(
          userId: userId,
          items: List<BasketItemEntity>.from(state.items),
        ),
      );
    });
  }
}
