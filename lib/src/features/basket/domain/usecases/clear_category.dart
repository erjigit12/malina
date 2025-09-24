import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class ClearCategory {
  ClearCategory(this.repository);

  final BasketRepository repository;

  Future<void> call({required String userId, required String category}) {
    return repository.clearCategory(userId: userId, category: category);
  }
}
