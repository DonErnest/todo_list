import 'package:flutter/material.dart';
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
    });
  }

  void cancelTask(Task task) {
    setState(() {
      userTasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TaskListScreen(
          tasks: userTasks,
          onComplete: completeTask,
          onCancel: cancelTask,
        ),
        appBar: AppBar(
          title: Text("To-Do list"),
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
