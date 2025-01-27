import 'package:flutter/material.dart';
import 'package:todo_list/data.dart';
import 'package:todo_list/widgets/decorated_container.dart';
import 'package:todo_list/widgets/task_row.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task task) onComplete;
  final void Function(Task task) onCancel;

  const TaskListScreen({
    super.key,
    required this.tasks,
    required this.onComplete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    List<TaskRow> rows = [];
    for (var task in tasks) {
      rows.add(
        TaskRow(
          task: task,
          onCancel: onCancel,
          onComplete: onComplete,
        ),
      );
    }

    return DecoratedContainer(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ),
    );
  }
}
