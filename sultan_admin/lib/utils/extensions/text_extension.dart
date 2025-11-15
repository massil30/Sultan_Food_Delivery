import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Headings
  TextStyle? get display => textTheme.displayLarge;
  TextStyle? get h1 => textTheme.headlineLarge;
  TextStyle? get h2 => textTheme.headlineMedium;
  TextStyle? get h3 => textTheme.headlineSmall;

  // Body text
  TextStyle? get body => textTheme.bodyLarge;
  TextStyle? get bodySmall => textTheme.bodyMedium;
  TextStyle? get caption => textTheme.bodySmall;

  // Other
  TextStyle? get subtitle => textTheme.titleMedium;
  TextStyle? get button => textTheme.labelLarge;
}
