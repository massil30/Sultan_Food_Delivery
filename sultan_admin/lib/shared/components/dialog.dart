

import 'package:flutter/material.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';
import 'package:sultan_admin/shared/components/button.dart';

Future<T?> showReusableDialog<T>(
  BuildContext context, {
  required String title,
  Widget? content,
  String? confirmLabel,
  String? cancelLabel,
  bool barrierDismissible = true,
  Color? confirmColor,
  Color? cancelColor,
  VoidCallback? onConfirm,
}) {
  final themeConfirm = confirmColor ?? context.c_primary;
  final themeCancel = cancelColor ?? context.c_textSecondary;

  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) {
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: [
          if (cancelLabel != null)
            AppOutlinedButton(
              label: cancelLabel,
              onPressed: () {
                Navigator.of(context).pop(false as T);
                if (onConfirm == null) {}
              },
            ),
          if (confirmLabel != null)
            AppButton(
              label: confirmLabel,
              onPressed: () {
                Navigator.of(context).pop(true as T);
                if (onConfirm != null) onConfirm();
              },
            ),
        ],
      );
    },
  );
}

/// Convenience themed dialogs
Future<bool?> showConfirmDialog(BuildContext ctx,
    {required String title, String? content}) {
  return showReusableDialog<bool>(
    ctx,
    title: title,
    content: content != null ? Text(content) : null,
    confirmLabel: 'Confirm',
    cancelLabel: 'Cancel',
    barrierDismissible: false,
  );
}

Future<void> showInfoDialog(BuildContext ctx,
    {required String title, String? content}) {
  return showReusableDialog<void>(
    ctx,
    title: title,
    content: content != null ? Text(content) : null,
    confirmLabel: 'OK',
  );
}

Future<void> showErrorDialog(BuildContext ctx,
    {required String title, String? content}) {
  return showReusableDialog<void>(
    ctx,
    title: title,
    content: content != null ? Text(content) : null,
    confirmLabel: 'Close',
  );
}

Future<void> showSuccessDialog(BuildContext ctx,
    {required String title, String? content}) {
  return showReusableDialog<void>(
    ctx,
    title: title,
    content: content != null ? Text(content) : null,
    confirmLabel: 'OK',
  );
}