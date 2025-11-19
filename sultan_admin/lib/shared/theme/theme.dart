import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




class AppThemes {
  // Base colors
  static const Color primaryColor = Color(0xFFE53935); // Brand red
  static const Color secondaryColor = Color(0xFFFFCDD2); // Soft variant
  static const Color accentColor = Color(0xFFD81B60); // Strong accent
  static const Color backgroundLight = Colors.white;
  static const Color surfaceLight = Color(0xFFF9F9F9);
  static const Color errorColor = Color(0xFFD32F2F);

  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  static TextTheme _textTheme(Color primary, Color secondary, Color disabled) =>
      TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 36.sp,
          fontWeight: FontWeight.bold,
          color: primary,
          height: 1.2,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
          color: primary,
          height: 1.2,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: primary,
          height: 1.2,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: primary,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: secondary,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: disabled,
          height: 1.4,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: primary,
          height: 1.2,
        ),
      );

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceLight,
      background: backgroundLight,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
      onBackground: Colors.black87,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: backgroundLight,
    textTheme: _textTheme(Colors.black87, Colors.black54, Colors.black26),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      foregroundColor: Colors.black87,
      elevation: 2,A
    ),
    cardTheme: CardThemeData(
      color: surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      margin: EdgeInsets.all(8.w),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceLight,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(8.r),
      ),
      hintStyle: GoogleFonts.inter(
        color: Colors.black54,
        fontStyle: FontStyle.italic,
        fontSize: 16.sp,
      ),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceDark,
      background: backgroundDark,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: backgroundDark,
    textTheme: _textTheme(Colors.white, Colors.white70, Colors.white38),
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceDark,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    cardTheme: CardThemeData(
      color: surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      margin: EdgeInsets.all(8.w),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceDark,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor),
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
}
