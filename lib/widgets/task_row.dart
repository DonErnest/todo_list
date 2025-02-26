import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/util.dart';

class TaskRow extends StatelessWidget {
  final Task task;
  final void Function(Task task) onComplete;
  final void Function(Task task) onCancel;
  final void Function(String id) onEdit;

  const TaskRow({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onCancel, required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    var onCompleteIcon =
    task.done ? Icons.check_box_outlined : Icons.check_box_outline_blank;

    Color activeColor = Theme
        .of(context)
        .colorScheme
        .primary;
    var textTheme = Theme
        .of(context)
        .textTheme
        .titleLarge!
        .copyWith(
      fontWeight: FontWeight.bold,
      color: activeColor,
    );
    Color dateColor = Theme
        .of(context)
        .colorScheme
        .onSecondaryContainer;
    // текст становится серым и выводится перечеркнутым, это, кажется, ближайший
    // "серый" читаемый цвет из тем, чтобы не было "захардкожено"
    // жирность и перечеркнутость можно захардкодить
    if (task.done) {
      activeColor = Theme
          .of(context)
          .colorScheme
          .secondary;
      textTheme = Theme
          .of(context)
          .textTheme
          .titleLarge!
          .copyWith(
        fontWeight: FontWeight.bold,
        color: activeColor,
        decoration: TextDecoration.lineThrough,
      );
      if (task.deadLine != null && task.deadLine!.isAfter(task.completedOn!)) {
        dateColor = Colors.green;
      } else {
        dateColor = Theme
            .of(context)
            .colorScheme
            .error;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: activeColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.description.length > 15
                      ? task.description.substring(0, 15) + "..."
                      : task.description,
                  style: textTheme,
                ),
                Spacer(),
                ElevatedButton(
                  child: Icon(
                    onCompleteIcon,
                    color: activeColor,
                  ),
                  onPressed: () => {onComplete(task)},
                ),
              ],
            ),
            Row(
              children: [
                Icon(getCategoryById(task.categoryId).icon, size: 30,),
                SizedBox(width: 10),
                Text(
                  "До: ${task.deadLine != null? formatDateTime(task.deadLine!): "ишачьей пасхи"}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: dateColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
