import 'package:flutter/material.dart';
import 'package:todo_list/data.dart';

class NewTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;

  const NewTask({super.key, required this.onTaskCreated});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var taskDescription = "";

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    setState(() {
      final task = Task(description: taskDescription);
      widget.onTaskCreated(task);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => setState(() => taskDescription = value),
            maxLines: 1,
            decoration: const InputDecoration(
              label: Text("enter task description"),
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: onCanceled, child: Text('Cancel')),
              const Spacer(),
              ElevatedButton(
                onPressed: onSaved,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
