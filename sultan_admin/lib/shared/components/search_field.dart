import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/shared/components/text_field.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';

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
      prefix: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 4.w),
        child: Icon(Icons.search, color: context.c_textSecondary),
      ),
      suffix: IconButton(
        icon: Icon(Icons.close, color: context.c_textSecondary),
        onPressed: onClear,
      ),
      onChanged: onChanged,
    );
  }
}