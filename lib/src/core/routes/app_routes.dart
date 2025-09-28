import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/features/features.dart';
import 'package:malina/src/injection_container.dart';

class AppRoutes {
  static const String login = '/login';
  static const String main = '/main';
  static const String home = '/home';
  static const String basket = '/basket';
  static const String profile = '/profile';
  static const String addBasket = '/add_basket';
  static const String qrScanner = '/qr_scanner';
}

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    redirect: (context, state) async {
      final location = state.matchedLocation;
      final loggingIn = location == AppRoutes.login;
      final hasSession = await sl<CheckAuthStatus>()();
      if (!hasSession && !loggingIn) {
        return AppRoutes.login;
      }
      if (hasSession && loggingIn) {
        return AppRoutes.main;
      }
      return null;
    },
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
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.addBasket,
        builder: (context, state) => const AddBasketPage(),
      ),
      GoRoute(
        path: AppRoutes.qrScanner,
        builder: (context, state) {
          final args =
              state.extra as QrScannerArgs? ??
              const QrScannerArgs(origin: QrScannerOrigin.home);
          return BlocProvider(
            create: (_) => sl<QrScannerBloc>()..add(QrScannerStarted()),
            child: QrScannerPage(args: args),
          );
        },
      ),
    ],
  );
}
