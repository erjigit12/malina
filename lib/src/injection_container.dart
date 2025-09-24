import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:malina/src/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:malina/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:malina/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina/src/features/auth/domain/usecases/check_auth_status.dart';
import 'package:malina/src/features/auth/domain/usecases/delete_account.dart';
import 'package:malina/src/features/auth/domain/usecases/get_current_user.dart';
import 'package:malina/src/features/auth/domain/usecases/login_user.dart';
import 'package:malina/src/features/auth/domain/usecases/logout_user.dart';
import 'package:malina/src/features/auth/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => CheckAuthStatus(sl()));
  sl.registerLazySingleton(() => DeleteAccount(sl()));

  // Bloc
  sl.registerFactory(() => LoginBloc(loginUser: sl()));
}
