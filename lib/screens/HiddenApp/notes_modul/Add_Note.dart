import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/JSON_FILS/Note_JSON.dart';
import '../../../data/dataClasses/Notes.dart';

class Add_Note extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    TextEditingController heading = TextEditingController();
    TextEditingController content = TextEditingController();
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Note"),
        backgroundColor: const Color(0xff82E0C8),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color(0xff0BB300),
        onPressed: () {
          String headingText = heading.text;
          String contentText = content.text;
          if (headingText == '') {
            if (contentText.length > 15) {
              headingText = '${contentText.substring(0, 14)}...';
            } else {
              headingText = 'No Heading';
            }
          }
          Note note = Note(headingText, contentText, DateTime.now());
          notes_detailed.add(note.toJson());
          print('Notes are: ${notes_detailed.length}');
          createNotesList();
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.done,
          color: Colors.white,
          size: 50,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView(shrinkWrap: true, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: TextField(
              controller: heading,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration.collapsed(
                hintText: 'Note Heading..',
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
              ),
            ),
          ),
          Container(
            width: screenHight / 2,
            height: (screenHight - screenHight / 2.7),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: TextField(
              controller: content,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Tap to start writing..',
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
