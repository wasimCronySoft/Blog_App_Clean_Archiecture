import 'package:clean_arch_application/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(
        AppPallete.backgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
  );

//Passing the default color
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final ligthTheme = ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(27),
    border: _border(),
    enabledBorder: _border(),
    focusedBorder: _border(AppPallete.gradient2),
    errorBorder: _border(AppPallete.errorColor),
  ));
}
