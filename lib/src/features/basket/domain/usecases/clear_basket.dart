import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class ClearBasket {
  ClearBasket(this.repository);

  final BasketRepository repository;

  Future<void> call({required String userId}) {
    return repository.clearAll(userId: userId);
  }
}
