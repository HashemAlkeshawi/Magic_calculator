import 'dart:collection';
import 'dart:ui';

import '../dataBase/DataBase.dart';
import '../dataClasses/Todos.dart';

Map<String, dynamic> tasks = {
  'name': 'To-Do',
  'date': DateTime.now(),
  'color': const Color(0xff8E8BFF),
  'desc':
      'Make sure that your tasks are written down all in one place so you don\'t forget anything important.',
};

List<Task> TasksList = [];

getTasksDataFromDB() async {
  List<Map<String, dynamic>> Tasks =
      await magicDataBase().readData(tableName: Tables.tasks);
  TasksList = Tasks.map((e) => Task.fromJson(e)).toList();

  TasksList.sort(((a, b) {
    if ((a.isDone! && b.isDone!) || (!a.isDone! && !b.isDone!)) {
      return 0;
    } else if (a.isDone! && !b.isDone!) {
      return -1;
    } else {
      return 1;
    }
  }));
}
