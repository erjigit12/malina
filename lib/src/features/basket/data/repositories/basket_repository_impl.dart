import 'package:malina/src/features/basket/data/datasources/basket_local_data_source.dart';
import 'package:malina/src/features/basket/data/models/basket_item_model.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class BasketRepositoryImpl implements BasketRepository {
  BasketRepositoryImpl(this._localDataSource);

  final BasketLocalDataSource _localDataSource;

  @override
  Future<List<BasketItemEntity>> fetchItems({required String userId}) async {
    final models = await _localDataSource.fetchItems(userId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> upsertItem({required String userId, required BasketItemEntity item}) {
    return _localDataSource.upsertItem(userId, BasketItemModel.fromEntity(item));
  }

  @override
  Future<void> upsertItems({required String userId, required List<BasketItemEntity> items}) {
    return _localDataSource.upsertItems(
      userId,
      items.map(BasketItemModel.fromEntity).toList(),
    );
  }

  @override
  Future<void> removeItem({required String userId, required String itemId}) {
    return _localDataSource.removeItem(userId, itemId);
  }

  @override
  Future<void> clearCategory({required String userId, required String category}) {
    return _localDataSource.clearCategory(userId, category);
  }

  @override
  Future<void> clearAll({required String userId}) {
    return _localDataSource.clearAll(userId);
  }
}
