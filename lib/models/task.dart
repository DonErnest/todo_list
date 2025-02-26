import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskCategory {
  final int id;
  final String name;
  final IconData icon;

  TaskCategory({required this.id, required this.name, required this.icon});
}

const uuid = Uuid();

class Task {
  late final String id;
  final String description;
  final int categoryId;
  bool done;
  DateTime? deadLine;
  DateTime? completedOn;

  Task({
    String? id,
    required this.description,
    required this.categoryId,
    this.deadLine,
    this.done = false,
  }) : id = id ?? uuid.v4();
}

int getCompletedCountByWeekDay(int weekDay, List<Task> tasks) {
  var today = DateTime.now();
  return tasks
      .where((task) =>
          task.done &&
          task.completedOn != null &&
          task.completedOn!.isAfter(today.subtract(Duration(days: 7))) &&
          task.completedOn!.weekday == weekDay)
      .length;
}

var shoppingCategory =
    TaskCategory(id: 1, name: "Покупки", icon: Icons.shopping_bag);
var meetingCategory =
    TaskCategory(id: 2, name: "Встречи", icon: Icons.handshake_outlined);
var workCategory =
    TaskCategory(id: 3, name: "Работа", icon: Icons.work_outline);
var adventureCategory =
    TaskCategory(id: 4, name: "Приключение", icon: Icons.route);

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
  ),
  Task(
    description: "найти смысл жизни",
    categoryId: adventureCategory.id,
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
  Task(
    description: "отмыть Бишкек",
    categoryId: adventureCategory.id,
    deadLine: DateTime.now().add(Duration(days: 3560)),
  ),
  Task(
    description: "свести счеты с Дедом Морозом",
    categoryId: meetingCategory.id,
    deadLine: DateTime.now().add(Duration(days: 365)),
  ),
  Task(
      description: "купить подарок на 8 марта",
      deadLine: DateTime(2025, 3, 8, 9, 0, 0),
      categoryId: shoppingCategory.id),
  Task(description: "стать синьором", categoryId: workCategory.id),
];
