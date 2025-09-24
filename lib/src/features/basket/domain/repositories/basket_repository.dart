import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';

abstract class BasketRepository {
  Future<List<BasketItemEntity>> fetchItems({required String userId});
  Future<void> upsertItem({required String userId, required BasketItemEntity item});
  Future<void> upsertItems({required String userId, required List<BasketItemEntity> items});
  Future<void> removeItem({required String userId, required String itemId});
  Future<void> clearCategory({required String userId, required String category});
  Future<void> clearAll({required String userId});
}
