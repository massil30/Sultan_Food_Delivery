import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart'; // use AppColors

final ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimary,
  colorScheme: ColorScheme.light(
    primary: AppColors.lightPrimary,
    secondary: AppColors.lightSecondary,
    surface: AppColors.lightSurface,
    background: AppColors.lightBackground,
    error: AppColors.lightError,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
    onBackground: Colors.black87,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.lightBackground,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.lato(
      fontSize: 36.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      height: 1.2,
    ),
    headlineLarge: GoogleFonts.lato(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
      height: 1.2,
    ),
    headlineMedium: GoogleFonts.lato(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
      height: 1.2,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
      height: 1.5,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
      height: 1.5,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black26,
      height: 1.4,
    ),
    labelSmall: GoogleFonts.lato(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
      height: 1.2,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    foregroundColor: Colors.black87,
  ),
 
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.lightSurface,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightPrimary),
      borderRadius: BorderRadius.circular(8.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightError),
      borderRadius: BorderRadius.circular(8.r),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26),
      borderRadius: BorderRadius.circular(8.r),
    ),
    hintStyle: GoogleFonts.lato(
      color: Colors.black54,
      fontStyle: FontStyle.italic,
      fontSize: 16.sp,
    ),
  ),
);