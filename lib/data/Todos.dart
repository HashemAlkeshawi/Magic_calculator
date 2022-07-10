class Task {
  String? task = '';

  Task.fromJson(Map<String, dynamic> map) {
    this.task = map['heading'];
  }
}
