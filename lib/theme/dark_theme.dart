import 'package:flutter/material.dart';
import 'package:todo_list/theme/colors.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(84, 19, 136, 1),
  brightness: Brightness.dark,
);
final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      foregroundColor: darkColorScheme.onPrimaryContainer,
      titleTextStyle: TextStyle(
          color: darkColorScheme.onPrimaryContainer
      ),
      toolbarTextStyle: TextStyle(color: darkColorScheme.onPrimaryContainer),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.onPrimaryContainer,
        foregroundColor: darkColorScheme.primaryContainer,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: darkColorScheme.onPrimaryContainer,
        foregroundColor: darkColorScheme.primaryContainer,
      ),
    ),
  extensions: [checkBoxCustomColors]
);

final checkBoxCustomColors = CustomColors(
  checkBoxBackground: Color.fromRGBO(217, 3, 104, 1),
  doneCheckBox: Color.fromRGBO(241, 233, 218, 1),
);