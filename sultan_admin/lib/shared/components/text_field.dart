import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool enabled;
  final int? maxLines;

  // NEW: styling overrides (optional, fall back to theme via extensions)
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final double borderWidth;

  const ReusableTextField({
    super.key,
    this.controller,
    this.hint,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.enabled = true,
    this.maxLines = 1,
    // styling defaults
    this.borderRadius = 8.0,
    this.contentPadding,
    this.borderColor,
    this.fillColor,
    this.hintColor,
    this.textColor,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final fill = (fillColor ?? (enabled ? context.c_surface : context.c_disabled));
    final bColor = borderColor ?? context.c_border;
    final hColor = hintColor ?? context.c_secondary;
    final tColor = textColor ?? context.c_primary;
    final padding = contentPadding ?? context.psh16;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      enabled: enabled,
      maxLines: maxLines,
      style: TextStyle(color: tColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: hColor),
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: fill,
        contentPadding: padding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: bColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: bColor, width: borderWidth),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: bColor.withOpacity(0.6), width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: context.c_primary, width: borderWidth + 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: context.c_error, width: borderWidth + 0.5),
        ),
      ),
    );
  }
}