import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magic_calculator/data/JSON_data.dart';
import 'package:magic_calculator/screens/HiddenApp/notes_modul/Notes_UI.dart';
import 'package:magic_calculator/screens/HiddenApp/tasks_modul/Tasks_UI.dart';

import '../../../widgets/drawer.dart';

class Journals_UI extends StatelessWidget {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Journal"),
        backgroundColor: Color(0xffFF7276),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: drawer(Color(0xaaFF7276)),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        height: screenHight,
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "Hello, it is ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.Hm().format(DateTime.now()).toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffFF7276),
                  ),
                )
              ],
            ),
            ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: JournalList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(JournalList[index].heading!),
                      ),
                      subtitle: Text(
                        JournalList[index].dateTime.toString().substring(0, 10),
                        style: TextStyle(color: Color(0xffFF7276)),
                      ),
                      trailing: Container(
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        width: 90,
                        child: Row(children: [
                          Text(
                            JournalList[index]
                                .dateTime
                                .toString()
                                .substring(10, 16),
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Icon(Icons.edit),
                        ]),
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
