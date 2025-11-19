import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kThemeModeKey = "theme_mode";

class UserTheme {
  Future<ThemeMode> loadTheme() async {
  final SharedPreferences prefs = GetIt.I<SharedPreferences>();
    final value = prefs.getString(kThemeModeKey);

    switch (value) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      case "system":
      default:
        return ThemeMode.system;
    }
  }

  Future<void> saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    final value = mode.toString().split('.').last;
    await prefs.setString(kThemeModeKey, value);
  }
}
