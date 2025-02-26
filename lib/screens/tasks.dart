import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/widgets/decorated_container.dart';
import 'package:todo_list/widgets/task_row.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    final theme = Theme.of(context);

    return DecoratedContainer(
      widget: ListView.builder(
        itemBuilder: (ctx, idx) {
          final task = tasks[idx];
          return Slidable(
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) => onCancel(task),
                  icon: Icons.delete,
                  backgroundColor: theme.colorScheme.error.withAlpha(220),
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (ctx) => onEdit(task.id),
                  icon: Icons.edit,
                  backgroundColor: theme.colorScheme.secondary.withAlpha(220),
                  label: 'Edit',
                ),
              ],
            ),
            child: TaskRow(
              task: task,
              onCancel: onCancel,
              onComplete: onComplete,
              onEdit: onEdit,
            ),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
