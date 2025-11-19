import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';

class ReusableListItem extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool dense;
  final bool showDivider;

  const ReusableListItem({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
    this.subtitle,
    this.onTap,
    this.dense = false,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final tile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: dense ? 8.h : 12.h),
      leading: leading,
      trailing: trailing,
      title: Text(title, style: context.h2),
      subtitle: subtitle != null ? Text(subtitle!, style: context.caption) : null,
      onTap: onTap,
      tileColor: context.c_surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    );

    if (!showDivider) return tile;

    return Column(
      children: [
        tile,
        Divider(height: 1, color: context.c_border),
      ],
    );
  }
}