import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarCustom(
  BuildContext context, {
  required String title,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 24, right: 16, top: 8, bottom: 8),
      elevation: 10,
      showCloseIcon: true,
      closeIconColor: Colors.white,
    ),
  );
}
