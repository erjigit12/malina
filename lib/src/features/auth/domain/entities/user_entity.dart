import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String password;
  final int failedAttempts;

  const UserEntity({
    required this.email,
    required this.password,
    required this.failedAttempts,
  });

  @override
  List<Object?> get props => [email, password, failedAttempts];

  UserEntity copyWith({
    String? email,
    String? password,
    int? failedAttempts,
  }) {
    return UserEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      failedAttempts: failedAttempts ?? this.failedAttempts,
    );
  }
}
