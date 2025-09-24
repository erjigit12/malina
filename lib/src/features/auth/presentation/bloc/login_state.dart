part of 'login_bloc.dart';

enum FormStatus { pure, invalid, success, loading }

class LoginState extends Equatable {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final FormStatus formStatus;
  final LoginStatus? loginStatus;

  const LoginState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.formStatus = FormStatus.pure,
    this.loginStatus,
  });

  static const _noValue = Object();

  LoginState copyWith({
    String? email,
    String? password,
    Object? emailError = _noValue,
    Object? passwordError = _noValue,
    FormStatus? formStatus,
    Object? loginStatus = _noValue,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError:
          identical(emailError, _noValue)
              ? this.emailError
              : emailError as String?,
      passwordError:
          identical(passwordError, _noValue)
              ? this.passwordError
              : passwordError as String?,
      formStatus: formStatus ?? this.formStatus,
      loginStatus:
          identical(loginStatus, _noValue)
              ? this.loginStatus
              : loginStatus as LoginStatus?,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    emailError,
    passwordError,
    formStatus,
    loginStatus,
  ];
}
