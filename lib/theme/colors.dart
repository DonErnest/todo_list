import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color doneCheckBox;

  final Color checkBoxBackground;

  const CustomColors({
    required this.doneCheckBox,
    required this.checkBoxBackground,
  });

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      doneCheckBox: doneCheckBox ?? this.doneCheckBox,
      checkBoxBackground: checkBoxBackground ?? this.checkBoxBackground,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      doneCheckBox: doneCheckBox,
      checkBoxBackground: checkBoxBackground,
    );
  }
}
