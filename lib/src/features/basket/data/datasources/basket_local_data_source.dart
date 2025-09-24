import 'package:hive/hive.dart';
import 'package:malina/src/features/basket/data/models/basket_item_model.dart';

abstract class BasketLocalDataSource {
  Future<List<BasketItemModel>> fetchItems(String userId);
  Future<void> upsertItem(String userId, BasketItemModel item);
  Future<void> upsertItems(String userId, List<BasketItemModel> items);
  Future<void> removeItem(String userId, String itemId);
  Future<void> clearCategory(String userId, String category);
  Future<void> clearAll(String userId);
}

class BasketLocalDataSourceImpl implements BasketLocalDataSource {
  BasketLocalDataSourceImpl(this._hive);

  static const _boxPrefix = 'basket_box_';

  final HiveInterface _hive;

  Future<Box<BasketItemModel>> _openBox(String userId) async {
    final boxName = '$_boxPrefix${userId.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')}';
    if (_hive.isBoxOpen(boxName)) {
      return _hive.box<BasketItemModel>(boxName);
    }
    return _hive.openBox<BasketItemModel>(boxName);
  }

  @override
  Future<List<BasketItemModel>> fetchItems(String userId) async {
    final box = await _openBox(userId);
    return box.values.toList();
  }

  @override
  Future<void> upsertItem(String userId, BasketItemModel item) async {
    final box = await _openBox(userId);
    await box.put(item.id, item);
  }

  @override
  Future<void> upsertItems(String userId, List<BasketItemModel> items) async {
    final box = await _openBox(userId);
    await box.putAll({for (final item in items) item.id: item});
  }

  @override
  Future<void> removeItem(String userId, String itemId) async {
    final box = await _openBox(userId);
    await box.delete(itemId);
  }

  @override
  Future<void> clearCategory(String userId, String category) async {
    final box = await _openBox(userId);
    final keysToRemove = box.values
        .where((item) => item.category == category)
        .map((item) => item.id)
        .toList();
    await box.deleteAll(keysToRemove);
  }

  @override
  Future<void> clearAll(String userId) async {
    final box = await _openBox(userId);
    await box.clear();
  }
}
