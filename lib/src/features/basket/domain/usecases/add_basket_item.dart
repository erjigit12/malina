import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class AddBasketItem {
  AddBasketItem(this.repository);

  final BasketRepository repository;

  Future<void> call({required String userId, required BasketItemEntity item}) {
    return repository.upsertItem(userId: userId, item: item);
  }
}
