import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sultan_admin/shared/theme/dark_theme.dart';
import 'package:sultan_admin/shared/theme/light_theme.dart';
import 'package:sultan_admin/shared/theme/theme.dart';
import 'package:sultan_admin/test.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
      home: const TestPage(),
    );
  }
}