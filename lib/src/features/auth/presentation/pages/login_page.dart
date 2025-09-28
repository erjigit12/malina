import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged(String value) {
    context.read<LoginBloc>().add(LoginEmailChanged(value));
  }

  void _onPasswordChanged(String value) {
    context.read<LoginBloc>().add(LoginPasswordChanged(value));
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    context.read<LoginBloc>().add(LoginSubmitted());
  }

  void _onClearEmail() {
    _emailController.clear();
    _onEmailChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.formStatus == FormStatus.success) {
              context.read<BasketBloc>().add(BasketUserChanged(state.email));
              context.go(AppRoutes.main);
            } else if (state.loginStatus == LoginStatus.userDeleted &&
                state.passwordError != null) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(state.passwordError!)));
            } else if (state.loginStatus == LoginStatus.error &&
                state.passwordError != null) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(state.passwordError!)));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EmailField(
                        controller: _emailController,
                        errorText: state.emailError,
                        onChanged: _onEmailChanged,
                        onClear:
                            _emailController.text.isEmpty ? null : _onClearEmail,
                      ),
                      const SizedBox(height: 16),
                      PasswordField(
                        controller: _passwordController,
                        errorText: state.passwordError,
                        onChanged: _onPasswordChanged,
                        obscureText: _obscurePassword,
                        onToggleVisibility: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                      const SizedBox(height: 32),
                      ConfirmButton(
                        title: 'Войти',
                        onPressed: _onSubmit,
                        isLoading: state.formStatus == FormStatus.loading,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
