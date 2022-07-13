class Task {
  String task = '';
  bool isDone = false;

  Task(
    this.task,
  );

  Task.fromJson(Map<String, dynamic> map) {
    task = map['task'];
    isDone = map['isDone'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'task': task,
      'isDone': isDone,
    };
    return map;
  }
}
