import 'dart:ui';

import '../dataClasses/Todos.dart';

Map<String, dynamic> tasks = {
  'name': 'To-Do',
  'count': 0,
  'date': DateTime.now(),
  'color': const Color(0xff8E8BFF),
  'desc':
      'Make sure that your tasks are written down all in one place so you don\'t forget anything important.',
};

List<Task> TasksList = [];

addTask(Task task) {
  tasks['date'] = DateTime.now();
  TasksList.add(task);
}
