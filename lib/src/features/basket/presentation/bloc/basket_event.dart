part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object?> get props => [];
}

class BasketStarted extends BasketEvent {
  const BasketStarted();
}

class BasketCategorySelected extends BasketEvent {
  final String category;

  const BasketCategorySelected(this.category);

  @override
  List<Object?> get props => [category];
}

class BasketItemAdded extends BasketEvent {
  final BasketItemEntity item;

  const BasketItemAdded(this.item);

  @override
  List<Object?> get props => [item];
}

class BasketItemQuantityChanged extends BasketEvent {
  final String itemId;
  final int quantity;

  const BasketItemQuantityChanged({required this.itemId, required this.quantity});

  @override
  List<Object?> get props => [itemId, quantity];
}

class BasketItemUpdated extends BasketEvent {
  final BasketItemEntity item;

  const BasketItemUpdated(this.item);

  @override
  List<Object?> get props => [item];
}

class BasketItemRemoved extends BasketEvent {
  final String itemId;

  const BasketItemRemoved(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class BasketCleared extends BasketEvent {
  const BasketCleared();
}

class BasketCategoryCleared extends BasketEvent {
  final String category;

  const BasketCategoryCleared(this.category);

  @override
  List<Object?> get props => [category];
}

class BasketSubcategoryCleared extends BasketEvent {
  final String category;
  final String subcategory;

  const BasketSubcategoryCleared({required this.category, required this.subcategory});

  @override
  List<Object?> get props => [category, subcategory];
}
