import 'package:flutter/material.dart';

extension SpacingExtension on BuildContext {
  // Standard spacing
  double get s4 => 4.0;
  double get s8 => 8.0;
  double get s12 => 12.0;
  double get s16 => 16.0;
  double get s20 => 20.0;
  double get s24 => 24.0;
  double get s32 => 32.0;
  double get s48 => 48.0;

  // Padding helpers
  EdgeInsets get p16 => const EdgeInsets.all(16);
  EdgeInsets get pH16 => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get pV16 => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get p8 => const EdgeInsets.all(8);
  EdgeInsets get pH8 => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get pV8 => const EdgeInsets.symmetric(vertical: 8);
}
