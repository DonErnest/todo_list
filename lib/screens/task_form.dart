import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/util.dart';

class TaskForm extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  final Task? existingTask;


  const TaskForm({super.key, required this.onTaskCreated, required this.existingTask});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  var taskDescription = "";
  final descriptionController = TextEditingController();

  int? selectedCategory;
  final categoryController = TextEditingController();

  DateTime? selectedDate;
  final deadLineDateController = TextEditingController();

  TimeOfDay? selectedTimeOfDay;
  final deadLineTimeController = TextEditingController();


  @override
  void initState() {
    super.initState();

    if (widget.existingTask != null) {
      final existingTask = widget.existingTask!;
      descriptionController.text = existingTask.description;
      selectedDate = existingTask.deadLine;
      if (selectedDate != null) {
        selectedTimeOfDay = TimeOfDay.fromDateTime(selectedDate!);
      }
      selectedCategory = existingTask.categoryId;
    }
    if (selectedDate != null) {
      deadLineDateController.text = formatDate(selectedDate!);
      deadLineTimeController.text = formatTime(selectedTimeOfDay!);
    }
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    setState(() {
      if (selectedCategory == null) {
        return;
      }
      DateTime? dateTime;
      if (selectedDate != null && selectedTimeOfDay != null) {
        dateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          selectedTimeOfDay!.hour,
          selectedTimeOfDay!.minute,
        );
      }

      final task = Task(
        id: widget.existingTask?.id,
        description: descriptionController.text.trim(),
        deadLine: dateTime,
        categoryId: selectedCategory!,
      );
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
      initialTime: selectedTimeOfDay != null? selectedTimeOfDay! : TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTimeOfDay = pickedTime;
        deadLineTimeController.text = formatTime(pickedTime);
      });
    }
  }

  void onClearDate() {
    setState(() {
      selectedDate = null;
      selectedTimeOfDay = null;
      deadLineDateController.text = "";
      deadLineTimeController.text = "";
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    categoryController.dispose();
    deadLineTimeController.dispose();
    deadLineDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              onChanged: (value) => setState(() => taskDescription = value),
              maxLines: 1,
              decoration: const InputDecoration(
                label: Text("Описание задачи"),
              ),
            ),
            DropdownMenu(
              expandedInsets: EdgeInsets.zero,
              label: Text("Категория"),
              inputDecorationTheme: theme.inputDecorationTheme,
              dropdownMenuEntries: categories
                  .map(
                    (category) => DropdownMenuEntry(
                      value: category.id,
                      label: category.name,
                      leadingIcon: Icon(category.icon),
                    ),
                  )
                  .toList(),
              onSelected: (value) => setState(() {
                selectedCategory = value;
              }),
              controller: categoryController,
              initialSelection: selectedCategory,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: onDateTap,
                    readOnly: true,
                    controller: deadLineDateController,
                    decoration: InputDecoration(
                      label: Text('Дата дедлайна'),
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
                      label: Text('Время'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: onCanceled, child: Text('Cancel')),
                TextButton(onPressed: onClearDate, child: Text('Очистить дату')),
                ElevatedButton(
                  onPressed: onSaved,
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
