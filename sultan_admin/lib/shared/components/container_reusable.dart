import 'package:flutter/material.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';

class ContainerReusable extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? color;
  final double borderRadius;
  final double elevation;
  final BorderSide? border;
  final VoidCallback? onTap;
  final Alignment alignment;

  const ContainerReusable({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.borderRadius = 8.0,
    this.elevation = 0.0,
    this.border,
    this.onTap,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final bg = color ?? context.c_surface;
    final box = Material(
      color: bg,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: border ?? BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Container(
          alignment: alignment,
          width: width,
          height: height,
          padding: padding ?? context.pa16,
          margin: margin,
          child: child,
        ),
      ),
    );

    return box;
  }
}


