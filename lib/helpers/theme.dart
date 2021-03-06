import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    fontFamily: 'GmarketSans',
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      secondary: Colors.blueAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black38,
      ),
    ),
  );
}
