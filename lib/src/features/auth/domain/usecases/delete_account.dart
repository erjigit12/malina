import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';

class DeleteAccount {
  final AuthRepository repository;

  const DeleteAccount(this.repository);

  Future<void> call() => repository.deleteAccount();
}
