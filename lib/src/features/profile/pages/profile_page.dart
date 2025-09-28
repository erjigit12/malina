import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/auth/domain/entities/user_entity.dart';
import 'package:malina/src/features/auth/domain/usecases/delete_account.dart';
import 'package:malina/src/features/auth/domain/usecases/get_current_user.dart';
import 'package:malina/src/features/auth/domain/usecases/logout_user.dart';
import 'package:malina/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:malina/src/features/auth/presentation/widgets/confirm_button.dart';
import 'package:malina/src/features/basket/presentation/bloc/basket_bloc.dart';
import 'package:malina/src/features/basket/domain/usecases/clear_basket.dart';
import 'package:malina/src/injection_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserEntity?> _userFuture;
  UserEntity? _currentUser;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _userFuture = sl<GetCurrentUser>()()..then((value) => _currentUser = value);
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
              child: Text('Выйти', style: AppTextStyles.f14w400),
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
            _currentUser ??= snapshot.data;

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
                    title: 'Удалить',
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
    final action = await showModalBottomSheet<_LogoutAction>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Перед выходом', style: AppTextStyles.f20w700),
                const SizedBox(height: 12),
                Text(
                  'Сохранить корзину или удалить её содержимое?',
                  style: AppTextStyles.f16w400.copyWith(color: AppColors.lightBlack),
                ),
                const SizedBox(height: 24),
                ConfirmButton(
                  title: 'Сохранить корзину и выйти',
                  onPressed: () => Navigator.of(context).pop(_LogoutAction.keep),
                ),
                const SizedBox(height: 12),
                ConfirmButton(
                  title: 'Очистить корзину и выйти',
                  onPressed: () => Navigator.of(context).pop(_LogoutAction.clear),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Отмена',
                    style: AppTextStyles.f16w400.copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (action == null) return;

    if (action == _LogoutAction.clear && _currentUser != null) {
      await sl<ClearBasket>()(userId: _currentUser!.email);
    }

    await sl<LogoutUser>()();
    if (!mounted) return;
    context.read<BasketBloc>().add(const BasketUserChanged(null));
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
      if (_currentUser != null) {
        await sl<ClearBasket>()(userId: _currentUser!.email);
      }
      await sl<DeleteAccount>()();
      if (!mounted) return;
      context.read<BasketBloc>().add(const BasketUserChanged(null));
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

enum _LogoutAction { keep, clear }
