import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';
import 'package:malina/src/injection_container.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required String initialLocation})
    : _router = createRouter(initialLocation);

  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(
          create: (context) => sl<BasketBloc>()..add(const BasketStarted()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        title: 'Malina',
      ),
    );
  }
}
