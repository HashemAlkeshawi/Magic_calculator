import 'dart:collection';
import 'dart:ui';

import '../dataClasses/Todos.dart';

Map<String, dynamic> tasks = {
  'name': 'To-Do',
  'date': DateTime.now(),
  'color': const Color(0xff8E8BFF),
  'desc':
      'Make sure that your tasks are written down all in one place so you don\'t forget anything important.',
  'tasks': [
    {
      'task': "The first task",
      'isDone': false,
    },
    {
      'task': "The second task",
      'isDone': false,
    }
  ],
};

List<Map<String, dynamic>> Tasks = tasks['tasks'];

List<Task> TasksList = Tasks.map((e) => Task.fromJson(e)).toList();

addTask(Task task) {
  tasks['date'] = DateTime.now();
  TasksList.add(task);
}
