import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // SharedPreferences is async
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register the instance as a singleton
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // You can register other services here as well
  // locator.registerLazySingleton<ApiService>(() => ApiService());
}
