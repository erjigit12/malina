import 'package:equatable/equatable.dart';

enum LoginStatus { success, invalidPassword, userDeleted, error }

class LoginResult extends Equatable {
  final LoginStatus status;
  final String? message;
  final int? attemptsLeft;

  const LoginResult({required this.status, this.message, this.attemptsLeft});

  @override
  List<Object?> get props => [status, message, attemptsLeft];
}
