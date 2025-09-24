import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthStatus {
  final AuthRepository repository;

  const CheckAuthStatus(this.repository);

  Future<bool> call() {
    return repository.hasActiveSession();
  }
}
