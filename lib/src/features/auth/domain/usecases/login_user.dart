import 'package:equatable/equatable.dart';
import 'package:malina/src/features/auth/domain/entities/login_result.dart';
import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  const LoginUser(this.repository);

  Future<LoginResult> call(LoginParams params) {
    return repository.login(email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
