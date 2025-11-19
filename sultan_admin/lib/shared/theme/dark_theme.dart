import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart'; // use AppColors

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.darkPrimary,
    secondary: AppColors.darkSecondary,
    surface: AppColors.darkSurface,
    background: AppColors.darkBackground,
    error: AppColors.darkError,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 36.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1.2,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.2,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.2,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 1.5,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      height: 1.5,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white38,
      height: 1.4,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.2,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkSurface,
    foregroundColor: Colors.white,
    elevation: 2,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkSurface,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkPrimary),
      borderRadius: BorderRadius.circular(8.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkError),
      borderRadius: BorderRadius.circular(8.r),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white38),
      borderRadius: BorderRadius.circular(8.r),
    ),
    hintStyle: GoogleFonts.inter(
      color: Colors.white70,
      fontStyle: FontStyle.italic,
      fontSize: 16.sp,
    ),
  ),
);