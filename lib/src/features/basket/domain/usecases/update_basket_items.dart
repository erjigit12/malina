import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class UpdateBasketItems {
  UpdateBasketItems(this.repository);

  final BasketRepository repository;

  Future<void> call({
    required String userId,
    required List<BasketItemEntity> items,
  }) {
    return repository.upsertItems(userId: userId, items: items);
  }
}
