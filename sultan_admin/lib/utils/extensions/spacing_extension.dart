import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on BuildContext {
  // Horizontal & vertical spacing (responsive)
  double get s4 => 4.w;
  double get s8 => 8.w;
  double get s12 => 12.w;
  double get s16 => 16.w;
  double get s20 => 20.w;
  double get s24 => 24.w;
  double get s32 => 32.w;
  double get s48 => 48.w;

  // Vertical spacing using height
  double get v4 => 4.h;
  double get v8 => 8.h;
  double get v12 => 12.h;
  double get v16 => 16.h;
  double get v20 => 20.h;
  double get v24 => 24.h;
  double get v32 => 32.h;
  double get v48 => 48.h;

  // Padding helpers (responsive on both axes)
  EdgeInsets get pa16 => EdgeInsets.all(16.r);
  EdgeInsets get pa8 => EdgeInsets.all(8.r);

  EdgeInsets get psh16 => EdgeInsets.symmetric(horizontal: 16.w);
  EdgeInsets get psh8 => EdgeInsets.symmetric(horizontal: 8.w);

  EdgeInsets get psv16 => EdgeInsets.symmetric(vertical: 16.h);
  EdgeInsets get psv8 => EdgeInsets.symmetric(vertical: 8.h);
}
