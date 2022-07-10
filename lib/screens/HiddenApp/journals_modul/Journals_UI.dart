import 'package:flutter/material.dart';
import 'package:magic_calculator/data/JSON_data.dart';
import 'package:magic_calculator/screens/HiddenApp/notes_modul/Notes_UI.dart';
import 'package:magic_calculator/screens/HiddenApp/tasks_modul/Tasks_UI.dart';

class Journals_UI extends StatelessWidget {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    journals['journals'].add({'heading': "new"});

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF7276),
      ),
      drawer: Drawer(
        width: screenWidth / 1.5,
        backgroundColor: Color(0xffFF7276),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Journals_UI()));
              },
              title: Text("Journal"),
              leading: CircleAvatar(
                child: Icon(Icons.book_outlined),
                backgroundColor: Color(0xffFF7276),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notes_UI()));
              },
              title: Text("Notes"),
              leading: CircleAvatar(
                child: Icon(Icons.note_alt_outlined),
                backgroundColor: Color(0xff82E0C8),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tasks_UI()));
              },
              title: Text("To-Do"),
              leading: CircleAvatar(
                child: Icon(Icons.checklist),
                backgroundColor: Color(0xff8E8BFF),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: 300,
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "Hello, it is ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffFF7276),
                  ),
                )
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: JournalList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    child: Text(JournalList[index].heading!),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
