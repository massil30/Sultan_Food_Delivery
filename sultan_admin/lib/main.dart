import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/config/dependencies.dart';
import 'package:sultan_admin/features/products/presentation/views/product_list_view.dart';
import 'package:sultan_admin/shared/theme/dark_theme.dart';
import 'package:sultan_admin/shared/theme/light_theme.dart';
import 'package:sultan_admin/shared/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(390, 844), // Your design Figma size
        minTextAdapt: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: "Theme Switch",
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: themeMode,
      home: ProductListView(),
    );
  }
}
