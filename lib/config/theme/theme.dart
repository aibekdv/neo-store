import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,

  fontFamily: 'Roboto',

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16.0),
    bodyMedium: TextStyle(fontSize: 14.0),
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
);
