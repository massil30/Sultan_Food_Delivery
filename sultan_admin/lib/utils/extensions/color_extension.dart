import 'package:flutter/material.dart';
import 'package:sultan_admin/shared/theme/colors.dart';

extension ColorExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  // =========================
  // MAIN BRAND COLORS
  // =========================
  Color get c_primary   => isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
  Color get c_secondary => isDark ? AppColors.darkSecondary : AppColors.lightSecondary;
  Color get c_accent    => isDark ? AppColors.darkAccent : AppColors.lightAccent;

  // =========================
  // BACKGROUND / SURFACE
  // =========================
  Color get c_background => isDark ? AppColors.darkBackground : AppColors.lightBackground;
  Color get c_surface    => isDark ? AppColors.darkSurface : AppColors.lightSurface;
  Color get c_border     => isDark ? AppColors.darkBorder : AppColors.lightBorder;
  Color get c_disabled   => isDark ? AppColors.darkDisabled : AppColors.lightDisabled;
  Color get c_overlay    => isDark ? AppColors.darkOverlay : AppColors.lightOverlay;

  // =========================
  // TEXT COLORS
  // =========================
  Color get c_textPrimary   => isDark ? AppColors.darkText : AppColors.lightText;
  Color get c_textSecondary => isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
  Color get c_textDisabled  => isDark ? AppColors.darkTextDisabled : AppColors.lightTextDisabled;

  // =========================
  // SEMANTIC COLORS
  // =========================
  Color get c_success => AppColors.success;
  Color get c_warning => AppColors.warning;
  Color get c_info    => AppColors.info;
  Color get c_error   => AppColors.error;

 
}
