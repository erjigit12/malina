import 'package:get_it/get_it.dart';
import 'package:malina/src/features/features.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => LoginBloc());
}
