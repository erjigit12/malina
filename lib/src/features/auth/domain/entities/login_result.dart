import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result.freezed.dart';

enum LoginStatus { success, invalidPassword, userDeleted, error }

@freezed
abstract class LoginResult with _$LoginResult {
  const factory LoginResult({
    required LoginStatus status,
    String? message,
    int? attemptsLeft,
  }) = _LoginResult;
}
