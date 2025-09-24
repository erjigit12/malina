import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina/src/core/core.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      final email = event.email;
      emit(
        state.copyWith(
          email: email,
          emailError: RegExpField.validateEmail(email),
          formStatus: FormStatus.pure,
        ),
      );
    });

    on<LoginPasswordChanged>((event, emit) {
      final password = event.password;
      emit(
        state.copyWith(
          password: password,
          passwordError: RegExpField.validatePassword(password),
          formStatus: FormStatus.pure,
        ),
      );
    });

    on<LoginSubmitted>((event, emit) {
      final emailError = RegExpField.validateEmail(state.email);
      final passwordError = RegExpField.validatePassword(state.password);

      if (emailError == null && passwordError == null) {
        emit(
          state.copyWith(
            emailError: null,
            passwordError: null,
            formStatus: FormStatus.success,
          ),
        );
        // Здесь можно добавить вызов авторизации
      } else {
        emit(
          state.copyWith(
            emailError: emailError,
            passwordError: passwordError,
            formStatus: FormStatus.invalid,
          ),
        );
      }
    });
  }
}
