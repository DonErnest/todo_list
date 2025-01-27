class Task {
  final String description;
  bool done;

  Task({required this.description, this.done=false});
}


List<Task> tasks = [
  Task(description: "купить молоко"),
  Task(description: "захватить мир"),
  Task(description: "найти смысл жизни"),
  Task(description: "думать"),
];
