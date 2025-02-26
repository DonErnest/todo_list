import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/widgets/bar_chart.dart';


class TasksStatisticsScreen extends StatelessWidget {
  final List<Task> userTasks;

  const TasksStatisticsScreen({super.key, required this.userTasks});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Статистика по задачам за прошедшую неделю",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
              child: TasksBarChart(
            tasks: userTasks,
          )),
        ],
      ),
    );
  }
}
