import 'package:flutter/material.dart';

class TaskCategory {
  final int id;
  final String name;
  final IconData icon;

  TaskCategory({required this.id, required this.name, required this.icon});
}

class Task {
  final String description;
  final int categoryId;
  bool done;
  DateTime deadLine;
  DateTime? completedOn;

  Task( {required this.description, required this.categoryId, this.done = false, required this.deadLine});
}

String _zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDateTime(DateTime dateTime) {
  final day = _zeroPad(dateTime.day);
  final month = _zeroPad(dateTime.month);
  final year = dateTime.year;
  final hour = _zeroPad(dateTime.hour);
  final minute = _zeroPad(dateTime.minute);
  return '$day.$month.$year $hour:$minute';
}

String formatDate(DateTime dateTime) {
  final day = _zeroPad(dateTime.day);
  final month = _zeroPad(dateTime.month);
  final year = dateTime.year;
  return '$day.$month.$year';
}

String formatTime(TimeOfDay dateTime) {
  final hour = _zeroPad(dateTime.hour);
  final minute = _zeroPad(dateTime.minute);

  return '$hour:$minute';
}

var shoppingCategory = TaskCategory(id:1, name: "Покупки", icon: Icons.shopping_bag);
var meetingCategory = TaskCategory(id: 2, name: "Встречи", icon: Icons.handshake_outlined);
var workCategory = TaskCategory(id: 3, name: "Работа", icon: Icons.work_outline);
var adventureCategory = TaskCategory(id: 4, name: "Приключение", icon: Icons.route);

const anyCategory = 0;

var categories = [
  shoppingCategory,
  meetingCategory,
  workCategory,
  adventureCategory
];

TaskCategory getCategoryById(int id) {
  return categories.firstWhere((category) => category.id == id);
}

List<Task> tasks = [
  Task(
    description: "купить молоко",
    categoryId: shoppingCategory.id,
    deadLine: DateTime.now().add(Duration(days: 1)),
  ),
  Task(
    description: "захватить мир",
    categoryId: adventureCategory.id,
    deadLine: DateTime.now().subtract(Duration(days: 1)),
  ),
  Task(
    description: "найти смысл жизни",
    categoryId: adventureCategory.id,
    deadLine: DateTime.now().add(Duration(days: 15000)),
  ),
  Task(
    description: "подумать",
    categoryId: workCategory.id,
    deadLine: DateTime.now().add(Duration(hours: 1)),
  ),
  Task(
    description: "подготовиться к зиме",
    categoryId: meetingCategory.id,
    deadLine: DateTime.now().subtract(Duration(days: 70)),
  ),
];
