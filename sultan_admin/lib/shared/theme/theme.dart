import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sultan_admin/config/user_status.dart/user_theme.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    final service = GetIt.I<UserTheme>();
    return await service.loadTheme();  // async OK
  }

  Future<void> toggleTheme() async {
    final service = GetIt.I<UserTheme>();

    final newMode = (state.value == ThemeMode.light)
        ? ThemeMode.dark
        : ThemeMode.light;

    state = AsyncValue.data(newMode);

    await service.saveTheme(newMode);
  }
}


final themeProvider =
    AsyncNotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());
