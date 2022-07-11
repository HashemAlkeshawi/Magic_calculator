import 'dart:ui';

import '../dataClasses/Todos.dart';

Map<String, dynamic> tasks = {
  'name': 'To-Do',
  'count': 0,
  'date': DateTime.now(),
  'color': const Color(0xff8E8BFF),
  'desc':
      'Make sure that your tasks are written down all in one place so you don\'t forget anything important.',
  'tasks': tasks_detailed,
};

List<Map<String, dynamic>> tasks_detailed = [];

List<Task>? TasksList;

void createTasksList() {
  List tasks_ = tasks['tasks'];

  TasksList = (tasks_).map((e) => Task.fromJson(e)).toList();
  tasks['date'] = DateTime.now();
}
