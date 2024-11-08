import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
showSnackbarDialog({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.red,
      content: Text(message),
    ),
  );
}