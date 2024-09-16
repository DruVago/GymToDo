class Todo {
  final String id;
  final String task;
  bool isCompleted;

  Todo({
    required this.id,
    required this.task,
    this.isCompleted = false,
  });

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
