extension ColorExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Main colors
  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get surface => colorScheme.surface;
  Color get error => colorScheme.error;
  Color get background => Theme.of(this).scaffoldBackgroundColor;

  // Text colors (theme-aware)

  // Semantic colors
  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
  Color get info => AppColors.info;

  // Accent colors
  Color get accent1 => AppColors.accent1;
  Color get accent2 => AppColors.accent2;
  Color get accent3 => AppColors.accent3;
}
