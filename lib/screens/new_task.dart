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
  
  var selectedDate = DateTime.now();
  final deadLineDateController = TextEditingController();

  var selectedTimeOfDay = TimeOfDay.now();
  final deadLineTimeController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    deadLineDateController.text = formatDate(selectedDate);
    deadLineTimeController.text = formatTime(selectedTimeOfDay);
  }


  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    setState(() {
      final dateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTimeOfDay.hour,
        selectedTimeOfDay.minute,
      );
      final task = Task(description: taskDescription, deadLine: dateTime);
      widget.onTaskCreated(task);
      Navigator.pop(context);
    });
  }

  void onDateTap() async {
    final now = DateTime.now();
    // it's better not to plan task for more than 2 week sprint
    final lastDate = DateTime(now.year, now.month, now.day + 14);

    final dateFromUser = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: now,
      lastDate: lastDate,
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        deadLineDateController.text = formatDate(dateFromUser);
      });
    }
  }

  void onTimeTap() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDay,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTimeOfDay = pickedTime;
        deadLineTimeController.text = formatTime(pickedTime);
      });
    }
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
              Expanded(
                child: TextField(
                  onTap: onDateTap,
                  readOnly: true,
                  controller: deadLineDateController,
                  decoration: InputDecoration(
                    label: Text('Date'),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 100,
                child: TextField(
                  onTap: onTimeTap,
                  readOnly: true,
                  controller: deadLineTimeController,
                  decoration: InputDecoration(
                    label: Text('Time'),
                  ),
                ),
              ),
            ],
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
