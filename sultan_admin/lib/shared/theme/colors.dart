import 'package:flutter/material.dart';

/// Updated AppColors based on the new design system
class AppColors {
  // ==================== LIGHT THEME ====================
  static const Color lightBackground = Color(0xFFFFFFFF); // background
  static const Color lightSurface = Color(0xFFF7F7F7); // surface
  static const Color lightPrimary = Color(
    0xFFF9A800,
  ); // primary (YELLOW instead of red)
  static const Color lightSecondary = Color(
    0xFF2D2C2F,
  ); // secondary (dark gray/black)
  static const Color lightAccent = Color(0xFFF9A800); // accent same as primary
  static const Color lightError = Color(0xFFD93900); // error (from JSON)

  // Text Colors
  static const Color lightText = Color(0xFF2D2C2F); // primary text
  static const Color lightTextMuted = Color(0xFF616161); // secondary text
  static const Color lightTextDisabled = Color(0xFFBDBDBD); // disabled text

  // UI Elements
  static const Color lightBorder = Color(0xFFE0E0E0); // subtle borders
  static const Color lightDisabled = Color(0xFFF0F0F0); // disabled surfaces
  static const Color lightOverlay = Color.fromRGBO(45, 44, 47, 0.6);

  // ==================== DARK THEME ====================
  static const Color darkBackground = Color(0xFF121212); // dark bg
  static const Color darkSurface = Color(0xFF1E1E1E); // dark surface
  static const Color darkPrimary = Color(0xFFF9A800); // primary yellow
  static const Color darkSecondary = Color(0xFFE0E0E0); // for contrast
  static const Color darkAccent = Color(0xFFF9A800);
  static const Color darkError = Color(0xFFD93900);

  // Text Colors
  static const Color darkText = Color(0xFFE0E0E0);
  static const Color darkTextMuted = Color(0xFFB0B0B0);
  static const Color darkTextDisabled = Color(0xFF777777);

  // UI Elements
  static const Color darkBorder = Color(0xFF424242);
  static const Color darkDisabled = Color(0xFF2C2C2C);
  static const Color darkOverlay = Color.fromRGBO(45, 44, 47, 0.7);

  // ==================== SEMANTIC COLORS ====================
  static const Color success = Color(0xFF00875A); // from JSON
  static const Color warning = Color(0xFFF9A800); // yellow warning
  static const Color info = Color(0xFF2196F3); // blue info
  static const Color error = Color(0xFFD93900); // global error
}
