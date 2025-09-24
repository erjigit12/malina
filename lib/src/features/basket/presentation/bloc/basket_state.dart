part of 'basket_bloc.dart';

class BasketState extends Equatable {
  static const List<String> defaultCategories = <String>['Еда', 'Бьюти'];

  final List<BasketItemEntity> items;
  final bool isLoading;
  final String activeCategory;
  final String? errorMessage;

  const BasketState({
    this.items = const [],
    this.isLoading = false,
    this.activeCategory = defaultActiveCategory,
    this.errorMessage,
  });

  static const String defaultActiveCategory = 'Еда';

  static const _sentinel = Object();

  BasketState copyWith({
    List<BasketItemEntity>? items,
    bool? isLoading,
    String? activeCategory,
    Object? errorMessage = _sentinel,
  }) {
    return BasketState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      activeCategory: activeCategory ?? this.activeCategory,
      errorMessage:
          identical(errorMessage, _sentinel)
              ? this.errorMessage
              : errorMessage as String?,
    );
  }

  List<String> get categories {
    final set = {...defaultCategories, ...items.map((item) => item.category)};
    final list = set.toList()..sort();
    // Ensure default categories order preserved
    list.sort((a, b) {
      final defaultIndexA = defaultCategories.indexOf(a);
      final defaultIndexB = defaultCategories.indexOf(b);
      if (defaultIndexA != -1 && defaultIndexB != -1) {
        return defaultIndexA.compareTo(defaultIndexB);
      }
      if (defaultIndexA != -1) return -1;
      if (defaultIndexB != -1) return 1;
      return a.compareTo(b);
    });
    return list;
  }

  List<BasketItemEntity> itemsForCategory(String category) {
    return items.where((item) => item.category == category).toList()
      ..sort((a, b) => a.subcategory.compareTo(b.subcategory));
  }

  Map<String, List<BasketItemEntity>> groupedBySubcategory(String category) {
    final grouped = <String, List<BasketItemEntity>>{};
    for (final item in itemsForCategory(category)) {
      grouped.putIfAbsent(item.subcategory, () => []).add(item);
    }
    final sortedKeys = grouped.keys.toList()..sort();
    return {for (final key in sortedKeys) key: grouped[key]!};
  }

  double totalForCategory(String category) {
    return itemsForCategory(
      category,
    ).fold(0.0, (total, item) => total + item.totalPrice);
  }

  double get grandTotal => items.fold(0.0, (total, item) => total + item.totalPrice);

  @override
  List<Object?> get props => [items, isLoading, activeCategory, errorMessage];
}
