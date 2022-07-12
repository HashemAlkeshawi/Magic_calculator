import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magic_calculator/data/JSON_FILS/Journal_JSON.dart';
import 'package:magic_calculator/screens/HiddenApp/journals_modul/Edit_Journal.dart';
import 'package:magic_calculator/screens/HiddenApp/journals_modul/Journals_UI.dart';
import 'package:magic_calculator/widgets/Journal_item_ui.dart';

class diary extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());

  int index;
  diary(this.index);

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    String heading = '';
    String content = '';
    DateTime? dateTime = DateTime(1);
    JournalList.isNotEmpty
        ? {
            dateTime = JournalList[index].dateTime!,
            heading = JournalList[index].heading!,
            content = JournalList[index].content!
          }
        : {};

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFF7276),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Edit_Journal(index)));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: const Text("Journal"),
        backgroundColor: const Color(0xffFF7276),
        actions: [
          IconButton(
            onPressed: () {
              JournalList.removeAt(index);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Journals_UI()));
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: ListView(shrinkWrap: true, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(content),
          Divider(),
          Text(
            '${DateFormat.jm().format(dateTime)} - ${DateFormat.yMMMMEEEEd().format(dateTime)}',
            style: TextStyle(color: Color(0xffFF7276)),
          ),
        ]),
      ),
    );
  }
}
