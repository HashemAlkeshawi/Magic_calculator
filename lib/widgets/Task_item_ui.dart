import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/JSON_FILS/ToDo_JSON.dart';

class tasksList extends StatefulWidget {
  double screenHieght;
  tasksList(this.screenHieght);
  @override
  State<tasksList> createState() => _tasksListState();
}

class _tasksListState extends State<tasksList> {
  @override
  Widget build(BuildContext context) {
    return TasksList.isEmpty
        ? Container(
            height: widget.screenHieght / 1.5,
            child: Lottie.asset('assets/animations/empty_todo.json'))
        : ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (TasksList).length,
            itemBuilder: ((context, input) {
              int index = TasksList.length - (input + 1);
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Checkbox(
                    onChanged: (value) {
                      TasksList[index].isDone = !TasksList[index].isDone;
                      setState(() {});
                    },
                    value: TasksList[index].isDone,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      TasksList[index].task!.length < 18
                          ? TasksList[index].task!
                          : '${TasksList[index].task!.substring(0, 17)}...',
                      style: TextStyle(
                          decoration: TasksList[index].isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ),
                  trailing: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        TasksList.removeAt(index);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                        size: 30,
                      )),
                ),
              );
            }),
          );
  }
}
