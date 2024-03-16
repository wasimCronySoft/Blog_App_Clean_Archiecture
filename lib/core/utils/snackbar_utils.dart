import 'package:clean_arch_application/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppPallete.gradient3,
        ),
      );
  }

  static showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppPallete.errorColor,
        ),
      );
  }
}
