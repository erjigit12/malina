import 'package:go_router/go_router.dart';
import 'package:malina/src/features/features.dart';

class AppRoutes {
  static const String login = '/login';
  static const String main = '/main';
  static const String home = '/home';
  static const String basket = '/basket';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(path: AppRoutes.login, builder: (context, state) => const LoginPage()),
    GoRoute(path: AppRoutes.main, builder: (context, state) => const MainView()),
    GoRoute(path: AppRoutes.home, builder: (context, state) => const HomePage()),
    GoRoute(
      path: AppRoutes.basket,
      builder: (context, state) {
        final initialTab = state.extra as int? ?? 0;
        return BasketPage(initialTab: initialTab);
      },
    ),
  ],
);
