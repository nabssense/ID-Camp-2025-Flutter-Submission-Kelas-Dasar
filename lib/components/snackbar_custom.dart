import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarCustom(
  BuildContext context, {
  required String title,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 10,
      showCloseIcon: true,
      closeIconColor: Colors.white,
    ),
  );
}
