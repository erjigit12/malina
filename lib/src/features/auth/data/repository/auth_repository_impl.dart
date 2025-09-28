import 'package:malina/src/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:malina/src/features/auth/data/models/user_model.dart';
import 'package:malina/src/features/auth/domain/entities/login_result.dart';
import 'package:malina/src/features/auth/domain/entities/user_entity.dart';
import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._localDataSource, this._basketRepository);

  static const _maxAttempts = 3;

  final AuthLocalDataSource _localDataSource;
  final BasketRepository _basketRepository;

  @override
  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    try {
      final normalizedEmail = email.trim().toLowerCase();
      final storedUser = await _localDataSource.fetchUser(normalizedEmail);

      if (storedUser == null) {
        final newUser = UserModel(
          email: normalizedEmail,
          password: password,
          failedAttempts: 0,
        );
        await _localDataSource.saveUser(newUser);
        await _localDataSource.setCurrentUser(normalizedEmail);
        return const LoginResult(status: LoginStatus.success);
      }

      if (storedUser.password == password) {
        final updated = storedUser.copyWith(failedAttempts: 0, password: password);
        await _localDataSource.saveUser(updated);
        await _localDataSource.setCurrentUser(normalizedEmail);
        return const LoginResult(status: LoginStatus.success);
      }

      final attempts = storedUser.failedAttempts + 1;
      if (attempts >= _maxAttempts) {
        await _localDataSource.deleteUser(normalizedEmail);
        await _basketRepository.clearAll(userId: normalizedEmail);
        return const LoginResult(
          status: LoginStatus.userDeleted,
          message: 'Превышено количество попыток. Аккаунт удален.',
          attemptsLeft: 0,
        );
      }

      final remaining = _maxAttempts - attempts;
      final updated = storedUser.copyWith(failedAttempts: attempts);
      await _localDataSource.saveUser(updated);
      return LoginResult(
        status: LoginStatus.invalidPassword,
        attemptsLeft: remaining,
        message:
            'Неверный пароль. Осталось $remaining попыт${remaining == 1
                ? 'ка'
                : remaining >= 2 && remaining <= 4
                ? 'ки'
                : 'ок'}',
      );
    } catch (_) {
      return const LoginResult(
        status: LoginStatus.error,
        message: 'Не удалось выполнить вход. Попробуйте снова.',
      );
    }
  }

  @override
  Future<void> logout() async {
    await _localDataSource.clearCurrentUser();
  }

  @override
  Future<bool> hasActiveSession() async {
    final email = await _localDataSource.getCurrentUserEmail();
    if (email == null) {
      return false;
    }
    final storedUser = await _localDataSource.fetchUser(email);
    return storedUser != null;
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final email = await _localDataSource.getCurrentUserEmail();
    if (email == null) {
      return null;
    }
    return _localDataSource.fetchUser(email);
  }

  @override
  Future<void> deleteAccount() async {
    final email = await _localDataSource.getCurrentUserEmail();
    if (email == null) {
      return;
    }
    await _basketRepository.clearAll(userId: email);
    await _localDataSource.deleteUser(email);
    await _localDataSource.clearCurrentUser();
  }
}
