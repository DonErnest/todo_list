import 'package:flutter/material.dart';
import 'package:todo_list/theme/colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(84, 19, 136, 1),
);
final lightTheme = ThemeData.light().copyWith(
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      foregroundColor: lightColorScheme.onPrimaryContainer,
      titleTextStyle: TextStyle(
        color: lightColorScheme.onPrimaryContainer
      ),
      toolbarTextStyle: TextStyle(color: lightColorScheme.onPrimaryContainer),
  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.onPrimaryContainer,
        foregroundColor: lightColorScheme.primaryContainer,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: lightColorScheme.onPrimaryContainer,
        foregroundColor: lightColorScheme.primaryContainer,
      ),
    ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.pink)
  ),
  extensions: [checkBoxCustomColors],
);


final checkBoxCustomColors = CustomColors(
  doneCheckBox: Color.fromRGBO(217, 3, 104, 1),
  checkBoxBackground: Color.fromRGBO(241, 233, 218, 1),
);
