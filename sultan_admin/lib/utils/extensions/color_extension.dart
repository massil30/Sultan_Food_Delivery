import 'package:flutter/material.dart';
import 'package:sultan_admin/shared/theme/colors.dart';

extension ColorExtension on BuildContext {
  // =========================
  // MAIN BRAND COLORS
  // =========================
  Color get c_primary   => AppColors.lightPrimary;
  Color get c_secondary => AppColors.lightSecondary;
  Color get c_accent    => AppColors.lightAccent;

  // =========================
  // BACKGROUND / SURFACE
  // =========================
  Color get c_background => AppColors.lightBackground;
  Color get c_surface    => AppColors.lightSurface;
  Color get c_border     => AppColors.lightBorder;
  Color get c_disabled   => AppColors.lightDisabled;
  Color get c_overlay    => AppColors.lightOverlay;

  // =========================
  // TEXT COLORS
  // =========================
  Color get c_textPrimary   => AppColors.lightText;
  Color get c_textSecondary => AppColors.lightTextMuted;
  Color get c_textDisabled  => AppColors.lightTextDisabled;

  // =========================
  // SEMANTIC COLORS
  // =========================
  Color get c_success => AppColors.success;
  Color get c_warning => AppColors.warning;
  Color get c_info    => AppColors.info;
  Color get c_error   => AppColors.error;

  // =========================
  // NEUTRAL COLORS
  // =========================
 //  Color get c_white       => AppColors.white;
 // Color get c_black       => AppColors.black;
//  Color get c_transparent => AppColors.transparent;
}
