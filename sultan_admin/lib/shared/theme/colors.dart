import 'package:flutter/material.dart';

/// App Colors - Simplified color palette for light and dark themes
class AppColors {
  // ==================== LIGHT THEME ====================
  static const Color lightBackground = Color(0xFFFBFBFE);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF2196F3);
  static const Color lightSecondary = Color(0xFFE3F2FD);
  static const Color lightError = Color(0xFFD32F2F);

  // Text Colors
  static const Color lightText = Color(0xFF212121);
  static const Color lightTextMuted = Color(0xFF757575);

  // UI Elements
  static const Color lightBorder = Color(0xFFE0E0E0);

  // ==================== DARK THEME ====================
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkPrimary = Color(0xFF2196F3);
  static const Color darkSecondary = Color(0xFF1565C0);
  static const Color darkError = Color(0xFFEF5350);

  // Text Colors
  static const Color darkText = Color(0xFFE0E0E0);
  static const Color darkTextMuted = Color(0xFFB0B0B0);

  // UI Elements
  static const Color darkBorder = Color(0xFF424242);

  // ==================== SEMANTIC COLORS (Theme Independent) ====================
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // ==================== ACCENT COLORS ====================
  static const Color accent1 = Color(0xFF00BCD4);
  static const Color accent2 = Color(0xFFFF4081);
  static const Color accent3 = Color(0xFF9C27B0);

  // ==================== NEUTRAL COLORS ====================
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
}
