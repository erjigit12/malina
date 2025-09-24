import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class RemoveBasketItem {
  RemoveBasketItem(this.repository);

  final BasketRepository repository;

  Future<void> call({required String userId, required String itemId}) {
    return repository.removeItem(userId: userId, itemId: itemId);
  }
}
