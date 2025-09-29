import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_item_entity.freezed.dart';

@freezed
abstract class BasketItemEntity with _$BasketItemEntity {
  const factory BasketItemEntity({
    required String id,
    required String category,
    required String subcategory,
    required String name,
    required double price,
    required int quantity,
    String? description,
    String? imagePath,
    required DateTime createdAt,
  }) = _BasketItemEntity;

  const BasketItemEntity._();

  double get totalPrice => price * quantity;
}
