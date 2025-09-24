import 'package:malina/src/features/auth/domain/entities/login_result.dart';
import 'package:malina/src/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<LoginResult> login({required String email, required String password});
  Future<void> logout();
  Future<bool> hasActiveSession();
  Future<UserEntity?> getCurrentUser();
  Future<void> deleteAccount();
}
