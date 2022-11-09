class TaskModel {
  final String? name;
  bool isDone = false;
  TaskModel({
    this.name,
    required this.isDone,
  });
  void toggleDone() {
    isDone = !isDone;
  }
}
