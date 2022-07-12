import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/JSON_FILS/Note_JSON.dart';
import 'Edit_Note.dart';
import 'Notes_UI.dart';

class note extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());

  int index;
  note(this.index);

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff82E0C8),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Edit_Note(index)));
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: const Text("Note"),
        backgroundColor: const Color(0xff82E0C8),
        actions: [
          IconButton(
            onPressed: () {
              NoteList.removeAt(index);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Notes_UI()));
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
              NoteList[index].heading!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(NoteList[index].content!),
          Divider(),
          Text(
            '${DateFormat.jm().format(NoteList[index].dateTime!)} - ${DateFormat.yMMMMEEEEd().format(NoteList[index].dateTime!)}',
            style: TextStyle(color: Color(0xff82E0C8)),
          ),
        ]),
      ),
    );
  }
}
