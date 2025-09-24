import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class LoadBasketItems {
  LoadBasketItems(this.repository);

  final BasketRepository repository;

  Future<List<BasketItemEntity>> call(String userId) {
    return repository.fetchItems(userId: userId);
  }
}
