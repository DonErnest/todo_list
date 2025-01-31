import 'package:flutter/material.dart';

class Task {
  final String description;
  bool done;
  DateTime deadLine;
  DateTime? completedOn;

  Task({required this.description, this.done = false, required this.deadLine});
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

List<Task> tasks = [
  Task(
    description: "купить молоко",
    deadLine: DateTime.now().add(Duration(days: 1)),
  ),
  Task(
    description: "захватить мир",
    deadLine: DateTime.now().subtract(Duration(days: 1)),
  ),
  Task(
    description: "найти смысл жизни",
    deadLine: DateTime.now().add(Duration(days: 15000)),
  ),
  Task(
    description: "подумать",
    deadLine: DateTime.now().add(Duration(hours: 1)),
  ),
];
