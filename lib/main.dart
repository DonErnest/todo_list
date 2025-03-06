import 'package:flutter/material.dart';
import 'package:todo_list/theme/dark_theme.dart';
import 'package:todo_list/theme/light_theme.dart';
import 'package:todo_list/todo.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: TodoList(),
    ),
  );
}
