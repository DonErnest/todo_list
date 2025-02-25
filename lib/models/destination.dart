import 'package:flutter/material.dart';

class Destination {
  final Widget screenTitle;
  final String navLabel;
  final IconData icon;
  final IconData? selectedIcon;
  final List<Widget>? appBarActions;
  final Widget screen;

  Destination({
    required this.screenTitle,
    required this.navLabel,
    required this.icon,
    this.selectedIcon,
    this.appBarActions,
    required this.screen,
  });
}
