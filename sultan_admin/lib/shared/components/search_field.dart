import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/shared/components/text_field.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hint;
  final VoidCallback? onClear;

  const SearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.hint = 'Search',
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableTextField(
      controller: controller,
      hint: hint,
      onChanged: onChanged,
      // Real style mapping (adaptive using extensions)
      borderRadius: 8.0,
      contentPadding: EdgeInsets.all(8.r),
      borderColor: context.c_secondary, // "1px solid secondary text color"
      fillColor: context.c_surface, // "surface color"
      hintColor: context.c_secondary, // placeholder color
      textColor: context.c_primary, // primary text color
      prefix: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 4.w),
        child: Icon(Icons.search, color: context.c_secondary, size: 20.r),
      ),
      suffix: (controller != null || onClear != null)
          ? IconButton(
              icon: Icon(Icons.close, color: context.c_secondary, size: 20.r),
              onPressed: onClear,
              splashRadius: 18.r,
            )
          : null,
    );
  }
}