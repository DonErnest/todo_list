import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const TodoList(),
    ),
  );
}
