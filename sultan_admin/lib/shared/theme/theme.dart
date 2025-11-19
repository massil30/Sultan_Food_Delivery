import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeNotifier extends Notifier<ThemeMode> {
  static const _key = 'themeMode';

  @override
  ThemeMode build() {
    // Start loading the saved theme
    _loadTheme();
    return ThemeMode.light; // default before prefs load
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final modeStr = prefs.getString(_key) ?? 'system';
    final mode = _stringToThemeMode(modeStr);
    state = mode;
  }

  void setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _themeModeToString(mode));
    ThemeMode newMode = mode;
    state = newMode;
  }

  // HelpersT
  String _themeModeToString(ThemeMode mode) => mode.name;

  ThemeMode _stringToThemeMode(String str) {
    return ThemeMode.values.firstWhere(
      (e) => e.name == str,
      orElse: () => ThemeMode.system,
    );
  }


}

// Provider
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  () => ThemeNotifier(),
);