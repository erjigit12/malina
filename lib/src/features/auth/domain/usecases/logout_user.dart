import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';

class LogoutUser {
  final AuthRepository repository;

  const LogoutUser(this.repository);

  Future<void> call() => repository.logout();
}
