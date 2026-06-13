import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  final ThemeMode themeMode = ThemeMode.light;

  ThemeMode get thmemode => themeMode;

  final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(shadowColor: Colors.grey.shade100, elevation: 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(11),
        ),
      ),
    ),
  
  
  );

  final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.dark,
    ),
  );
}
