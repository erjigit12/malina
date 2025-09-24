import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/auth/domain/entities/login_result.dart';
import 'package:malina/src/features/auth/domain/usecases/login_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginUser loginUser})
    : _loginUser = loginUser,
      super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginReset>((event, emit) => emit(const LoginState()));
  }

  final LoginUser _loginUser;

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = event.email.trim();
    emit(
      state.copyWith(
        email: email,
        emailError: RegExpField.validateEmail(email),
        formStatus: FormStatus.pure,
        loginStatus: null,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        passwordError: RegExpField.validatePassword(password),
        formStatus: FormStatus.pure,
        loginStatus: null,
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final email = state.email.trim();
    final password = state.password;

    final emailError = RegExpField.validateEmail(email);
    final passwordError = RegExpField.validatePassword(password);

    if (emailError != null || passwordError != null) {
      emit(
        state.copyWith(
          email: email,
          emailError: emailError,
          passwordError: passwordError,
          formStatus: FormStatus.invalid,
          loginStatus: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        email: email,
        password: password,
        emailError: null,
        passwordError: null,
        formStatus: FormStatus.loading,
        loginStatus: null,
      ),
    );

    final result = await _loginUser(
      LoginParams(email: email, password: password),
    );

    switch (result.status) {
      case LoginStatus.success:
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            emailError: null,
            passwordError: null,
            loginStatus: LoginStatus.success,
          ),
        );
        break;
      case LoginStatus.invalidPassword:
      case LoginStatus.userDeleted:
      case LoginStatus.error:
        emit(
          state.copyWith(
            formStatus: FormStatus.invalid,
            passwordError: result.message ?? 'Не удалось выполнить вход',
            loginStatus: result.status,
          ),
        );
        break;
    }
  }
}
