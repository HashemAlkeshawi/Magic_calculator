import 'package:flutter/material.dart';

import 'package:magic_calculator/screens/HiddenApp/journals_modul/Journals_UI.dart';
import 'package:magic_calculator/screens/HiddenApp/tasks_modul/Tasks_UI.dart';
import '../../data/JSON_data.dart';
import 'notes_modul/Notes_UI.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String journali = journals['date'].toString().substring(0, 10);

    print(journali);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff951BDB),
          title: const Text("Home"),
        ),
        body: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return Journals_UI();
                })));
              },
              child: homeItem(
                  journals,
                  Icon(
                    Icons.book_outlined,
                    size: 35,
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return Notes_UI();
                })));
              },
              child: homeItem(
                  notes,
                  Icon(
                    Icons.note_alt_outlined,
                    size: 35,
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return Tasks_UI();
                })));
              },
              child: homeItem(
                  todos,
                  Icon(
                    Icons.checklist,
                    size: 35,
                  )),
            ),
          ],
        ));
  }

  Widget homeItem(Map<String, dynamic> map, Icon icon) {
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
          color: map['color'],
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                map['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              icon,
            ],
          ),
          Text(map['desc']),
          Row(
            children: [
              Text(
                "Last modify: ",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                map['date'].toString().substring(0, 10),
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue[900],
                    shadows: [Shadow(color: Colors.white, blurRadius: 1)]),
              ),
              Spacer(),
              Text(
                "Journals count: ",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                map['count'].toString(),
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue[900],
                    shadows: [Shadow(color: Colors.white, blurRadius: 1)]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
