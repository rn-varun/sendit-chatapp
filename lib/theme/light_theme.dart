import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: const Color.fromRGBO(238, 238, 238, 1),
    secondary: Colors.grey.shade400, 
    inversePrimary: Colors.grey.shade800
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black
  )
);