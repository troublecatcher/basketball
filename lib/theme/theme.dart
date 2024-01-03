import 'package:flutter/material.dart';

final appTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Color.fromRGBO(82, 41, 17, 1)),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Color.fromRGBO(82, 41, 17, 1),
        fontFamily: 'SrbijaSans',
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Color.fromRGBO(82, 41, 17, 1),
        fontFamily: 'SrbijaSans',
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'SrbijaSans',
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: Color.fromRGBO(82, 41, 17, 1),
        fontFamily: 'SrbijaSans',
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'SrbijaSans',
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Color.fromRGBO(82, 41, 17, 0.7),
        fontFamily: 'SrbijaSans',
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Color.fromRGBO(82, 41, 17, 0.7),
        fontFamily: 'SrbijaSans',
        fontSize: 14,
      ),
      displaySmall: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        fontFamily: 'SrbijaSans',
        fontSize: 14,
      ),
    ));
