import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/app/app.dart';
import 'package:malina/src/features/auth/domain/usecases/check_auth_status.dart';
import 'package:malina/src/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final hasSession = await sl<CheckAuthStatus>()();
  final initialLocation = hasSession ? AppRoutes.main : AppRoutes.login;
  runApp(MyApp(initialLocation: initialLocation));
}
