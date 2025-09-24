import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';

import 'package:malina/src/features/features.dart';
import 'package:malina/src/injection_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserEntity?> _userFuture;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _userFuture = sl<GetCurrentUser>()();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          title: Text('Профиль', style: AppTextStyles.f20w700),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: _logout,
              child: Text(
                'Выйти',
                style: AppTextStyles.f14w400.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        body: FutureBuilder<UserEntity?>(
          future: _userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final email = snapshot.data?.email;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    email ?? 'Неизвестный пользователь',
                    style: AppTextStyles.f20w700,
                  ),
                  const Spacer(),
                  ConfirmButton(
                    title: 'Удалить аккаунт',
                    onPressed: _deleteAccount,
                    isLoading: _isDeleting,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _logout() async {
    await sl<LogoutUser>()();
    if (!mounted) return;
    context.read<LoginBloc>().add(LoginReset());
    context.go(AppRoutes.login);
  }

  Future<void> _deleteAccount() async {
    final confirm =
        await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Удалить аккаунт?'),
              content: const Text(
                'Все данные пользователя будут удалены без возможности восстановления.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Отмена'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Удалить'),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!confirm) return;

    setState(() => _isDeleting = true);

    try {
      await sl<DeleteAccount>()();
      if (!mounted) return;
      context.read<LoginBloc>().add(LoginReset());
      context.go(AppRoutes.login);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('Аккаунт удалён.')));
    } finally {
      if (mounted) {
        setState(() => _isDeleting = false);
      }
    }
  }
}
