import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
import 'package:malina/src/features/basket/presentation/bloc/basket_bloc.dart';
import 'package:malina/src/features/basket/data/datasources/basket_local_data_source.dart';
import 'package:malina/src/features/basket/data/models/basket_item_model.dart';
import 'package:malina/src/features/basket/data/repositories/basket_repository_impl.dart';
import 'package:malina/src/features/basket/domain/repositories/basket_repository.dart';
import 'package:malina/src/features/basket/domain/usecases/add_basket_item.dart';
import 'package:malina/src/features/basket/domain/usecases/clear_basket.dart';
import 'package:malina/src/features/basket/domain/usecases/clear_category.dart';
import 'package:malina/src/features/basket/domain/usecases/load_basket_items.dart';
import 'package:malina/src/features/basket/domain/usecases/remove_basket_item.dart';
import 'package:malina/src/features/basket/domain/usecases/update_basket_items.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(BasketItemAdapter());
  }

  sl.registerLazySingleton<HiveInterface>(() => Hive);

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<BasketLocalDataSource>(
    () => BasketLocalDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<BasketRepository>(() => BasketRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => CheckAuthStatus(sl()));
  sl.registerLazySingleton(() => DeleteAccount(sl()));
  sl.registerLazySingleton(() => LoadBasketItems(sl()));
  sl.registerLazySingleton(() => AddBasketItem(sl()));
  sl.registerLazySingleton(() => UpdateBasketItems(sl()));
  sl.registerLazySingleton(() => RemoveBasketItem(sl()));
  sl.registerLazySingleton(() => ClearBasket(sl()));
  sl.registerLazySingleton(() => ClearCategory(sl()));

  // Bloc
  sl.registerFactory(() => LoginBloc(loginUser: sl()));
  sl.registerFactory(
    () => BasketBloc(
      loadBasketItems: sl(),
      addBasketItem: sl(),
      updateBasketItems: sl(),
      removeBasketItem: sl(),
      clearBasket: sl(),
      clearCategory: sl(),
      getCurrentUser: sl(),
    ),
  );
}
