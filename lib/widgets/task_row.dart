import 'package:flutter/material.dart';
import 'package:todo_list/data.dart';

class TaskRow extends StatelessWidget {
  final Task task;
  final void Function(Task task) onComplete;
  final void Function(Task task) onCancel;

  const TaskRow({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    var onCompleteIcon =
        task.done ? Icons.check_box_outlined : Icons.check_box_outline_blank;

    Color activeColor = Theme.of(context).colorScheme.primary;
    var textTheme = Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: activeColor,
    );

    // текст становится серым и выводится перечеркнутым, это, кажется, ближайший
    // "серый" читаемый цвет из тем, чтобы не было "захардкожено"
    // жирность и перечеркнутость можно захардкодить
    if (task.done) {
      activeColor = Theme.of(context).colorScheme.secondary;
      textTheme = Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: activeColor,
        decoration: TextDecoration.lineThrough,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: activeColor),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task.description.length > 20
                  ? task.description.substring(0, 20) + "..."
                  : task.description,
              style: textTheme,
            ),
            Spacer(),
            ElevatedButton(
              child: Icon(onCompleteIcon, color: activeColor,),
              onPressed: () => {onComplete(task)},
            ),
            ElevatedButton(
              child: Icon(Icons.delete, color: activeColor),
              onPressed: () => {onCancel(task)},
            ),
          ],
        ),
      ),
    );
  }
}
