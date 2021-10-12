import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[300],
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(3),
      backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
    ),
  ),
  dialogTheme: DialogTheme(backgroundColor: Colors.grey[300]),
  appBarTheme:
      AppBarTheme(backgroundColor: Colors.grey[500], centerTitle: true),
  // colorScheme: ColorScheme(
  //   primary: Colors.grey[300]!,
  //   primaryVariant: Colors.red,
  //   secondary: Colors.blueGrey,
  //   secondaryVariant: Colors.red,
  //   surface: Colors.red,
  //   background: Colors.grey,
  //   error: Colors.red,
  //   onPrimary: Colors.white,
  //   onSecondary: Colors.red,
  //   onSurface: Colors.red,
  //   onBackground: Colors.red,
  //   onError: Colors.red,
  //   brightness: Brightness.light,
  // ),
  primaryColor: Colors.grey,
);
