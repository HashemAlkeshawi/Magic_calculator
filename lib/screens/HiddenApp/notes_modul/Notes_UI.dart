import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_calculator/screens/HiddenApp/notes_modul/Add_Note.dart';

import '../../../data/JSON_FILS/Journal_JSON.dart';
import '../../../widgets/Note_item_ui.dart';
import '../../../widgets/drawer.dart';

class Notes_UI extends StatelessWidget {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Color(0xff82E0C8),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff82E0C8),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Note()));
          // List<Map<String, dynamic>> temp = journals_detailed;
          // Map<String, dynamic> entry = {
          //   'heading': 'My custom',
          //   'content': 'the new Custom contentthe',
          //   'datetime': DateTime.now(),
          // };
          // print(temp.length);
          // temp.add({...entry});

          // journals['journals'] = [temp];
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: drawer(Color(0xaa82E0C8)),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        height: screenHieght,
        child: ListView(
          children: [
            Row(
              children: [
                const Text(
                  "Hello, it is ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xffFF7276),
                  ),
                )
              ],
            ),
            NoteGridList(screenHieght),
          ],
        ),
      ),
    );
  }
}
