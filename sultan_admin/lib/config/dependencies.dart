import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sultan_admin/config/user_status.dart/user_theme.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // SharedPreferences is async
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register the instance as a singleton
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

// Register User Theme as LazySingleton
  locator.registerLazySingleton<UserTheme>(() => UserTheme());
  // You can register other services here as well
  // locator.registerLazySingleton<ApiService>(() => ApiService());
}
