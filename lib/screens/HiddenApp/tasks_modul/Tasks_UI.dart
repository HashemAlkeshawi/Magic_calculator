import 'package:flutter/material.dart';
import 'package:magic_calculator/data/JSON_FILS/ToDo_JSON.dart';

import '../../../data/dataClasses/Todos.dart';
import '../../../widgets/Task_item_ui.dart';
import '../../../widgets/drawer.dart';

class Tasks_UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TasksList.add(Task('task2'));

    double screenHight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Color(0xff8E8BFF),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: drawer(Color(0xaa8E8BFF)),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        height: screenHight,
        child: ListView(
          children: [
            Wrap(
              children: [
                const Text(
                  "The most effective way to ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'do it',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff4F8AFF),
                  ),
                ),
                const Text(
                  "is ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'to Do it',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff8E8BFF),
                  ),
                ),
              ],
            ),
            tasksList(screenHight),
          ],
        ),
      ),
    );
  }
}
