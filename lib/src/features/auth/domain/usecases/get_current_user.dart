import 'package:malina/src/features/auth/domain/entities/user_entity.dart';
import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  const GetCurrentUser(this.repository);

  Future<UserEntity?> call() {
    return repository.getCurrentUser();
  }
}
