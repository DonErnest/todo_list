import 'package:flutter/material.dart';
import 'package:todo_list/data.dart';
import 'package:todo_list/widgets/decorated_container.dart';
import 'package:todo_list/widgets/task_row.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task task) onComplete;
  final void Function(Task task) onCancel;
  final void Function(String id) onEdit;

  const TaskListScreen({
    super.key,
    required this.tasks,
    required this.onComplete,
    required this.onCancel,
    required this.onEdit,
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
          onEdit: onEdit,
        ),
      );
    }

    return DecoratedContainer(
      widget: ListView.builder(
        itemBuilder: (ctx, idx) => TaskRow(
          task: tasks[idx],
          onCancel: onCancel,
          onComplete: onComplete,
          onEdit: onEdit,
        ),
        itemCount: tasks.length,
      ),
    );
  }
}
