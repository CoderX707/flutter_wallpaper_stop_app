import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 195, 49, 124),
      onPrimary: Color.fromARGB(255, 195, 49, 124),
      secondary: Color.fromARGB(255, 24, 33, 45),
      onSecondary: Color.fromARGB(255, 24, 33, 45),
      error: Colors.red,
      onError: Colors.red,
      background: Color.fromARGB(255, 15, 22, 30),
      onBackground: Color.fromARGB(255, 15, 22, 30),
      surface: Color.fromARGB(255, 231, 231, 231),
      onSurface: Color.fromARGB(255, 219, 219, 219),
      secondaryContainer: Color.fromARGB(255, 205, 205, 205)),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 24, 33, 45),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 15, 22, 30),
);

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 195, 49, 124),
    onPrimary: Color.fromARGB(255, 195, 49, 124),
    secondary: Color.fromARGB(255, 205, 205, 205),
    onSecondary: Color.fromARGB(255, 205, 205, 205),
    error: Colors.red,
    onError: Colors.red,
    background: Color.fromARGB(255, 15, 22, 30),
    onBackground: Color.fromARGB(255, 15, 22, 30),
    surface: Color.fromARGB(255, 24, 33, 45),
    onSurface: Color.fromARGB(255, 24, 33, 45),
    secondaryContainer: Color.fromARGB(255, 87, 87, 87)
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 239, 239, 239),
);
