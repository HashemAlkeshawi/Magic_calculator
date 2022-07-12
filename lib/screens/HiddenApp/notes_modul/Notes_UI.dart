import 'package:flutter/material.dart';
import 'package:magic_calculator/data/JSON_FILS/Note_JSON.dart';
import 'package:magic_calculator/screens/HiddenApp/notes_modul/Add_Note.dart';

import '../../../widgets/Note_item_ui.dart';
import '../../../widgets/drawer.dart';

class Notes_UI extends StatefulWidget {
  @override
  State<Notes_UI> createState() => _Notes_UIState();
}

class _Notes_UIState extends State<Notes_UI> {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Color(0xff82E0C8),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    noteList.isNotEmpty
                        ? {noteList.clear(), setState(() {})}
                        : {};
                  },
                  child: ListTile(
                    minLeadingWidth: 5,
                    leading: Icon(Icons.delete,
                        color: noteList.isNotEmpty
                            ? Colors.grey[800]
                            : Colors.grey[400]),
                    title: Text(
                      "Delete All",
                      style: TextStyle(
                          color: noteList.isNotEmpty
                              ? Colors.grey[800]
                              : Colors.grey[500]),
                    ),
                  ),
                ),
              ];
            },
          ),
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
            Wrap(
              children: [
                const Text(
                  "The weakest ink is ",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'STRONGER ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 13, 176, 135),
                  ),
                ),
                const Text(
                  "than the ",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'strongest memory..',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff82E0C8),
                  ),
                ),
              ],
            ),
            NoteGridList(screenHieght),
          ],
        ),
      ),
    );
  }
}
