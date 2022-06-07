import 'dart:ui';

import 'package:flutter/material.dart';

class CoreUiConfig {
  CoreUiConfig._();

  static MaterialColor primaryColors =const  MaterialColor(
    0xFF0066B0, 
    {
      50: Color(0xFF005c9e),
      100: Color(0xFF00528d),
      200: Color(0xFF00477b),
      300: Color(0xFF003d6a),
      400: Color(0xFF003358),
      500: Color(0xFF002946),
      600: Color(0xFF001f35),
      700: Color(0xFF001423),
      800: Color(0xFF000a12),
      900: Color(0xFF000000),
    }
    );

  static ThemeData get theme => ThemeData(
      primarySwatch: primaryColors,
      primaryColor: const Color(0xFF0066B0),
      primaryColorLight: const Color(0xFF219FFF),
      // customizando o estilo do input diretamente no thema
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        isDense: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelStyle: const TextStyle(color: Colors.black),
      ),
      // customizando o estilo do elevatedButon diretamente no thema
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ))));
}
