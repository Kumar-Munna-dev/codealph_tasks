import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  static const _seedColor = Colors.blue;

  static const _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(11)),
  );

  static const _appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );

  static const _bottomNavTheme = BottomNavigationBarThemeData(
    elevation: 0,
    type: BottomNavigationBarType.fixed,
  );

  static final _buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      shape: _buttonShape,
    ),
  );

  ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
    scaffoldBackgroundColor: const Color(0xffF5F7FB),
    elevatedButtonTheme: _buttonTheme,
    iconTheme: const IconThemeData(color: Colors.lightBlue),
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavTheme,
  );

  ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xff121212),
    elevatedButtonTheme: _buttonTheme,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavTheme,
  );
}
