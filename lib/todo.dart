import 'package:flutter/material.dart';
import 'package:todo_list/screens/new_task.dart';
import 'package:todo_list/screens/tasks.dart';

import 'data.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var userTasks = tasks;

  void completeTask(Task task) {
    setState(() {
      task.done = !task.done;
      if (task.completedOn != null) {
        task.completedOn = null;
      } else {
        task.completedOn = DateTime.now();
      }
    });
  }

  void cancelTask(Task task) {
    setState(() {
      userTasks.remove(task);
    });
  }

  void addTask(Task newTask) {
    setState(() {
      userTasks.add(newTask);
    });
  }

  void openAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Wrap(children: [
        NewTask(
          onTaskCreated: addTask,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskListScreen(
        tasks: userTasks,
        onComplete: completeTask,
        onCancel: cancelTask,
      ),
      appBar: AppBar(
        title: Text(
          "To-Do list",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: openAddTaskSheet,
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
