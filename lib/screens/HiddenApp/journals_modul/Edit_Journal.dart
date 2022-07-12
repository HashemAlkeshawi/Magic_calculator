import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magic_calculator/data/JSON_FILS/Journal_JSON.dart';

import '../../../data/dataClasses/Journals.dart';

class Edit_Journal extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());

  int index;

  Edit_Journal(this.index);

  @override
  Widget build(BuildContext context) {
    TextEditingController heading = TextEditingController();
    TextEditingController content = TextEditingController();
    double screenHight = MediaQuery.of(context).size.height;

    heading.text = JournalList[index].heading ?? '';
    content.text = JournalList[index].content ?? '';

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Journal"),
        backgroundColor: const Color(0xffFF7276),
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
              print(contentText.length);
              headingText = 'No Heading';
            }
          }
          Journal journal = Journal(headingText, contentText, DateTime.now());
          JournalList[index] = (journal);
          print(JournalList.length);
          Navigator.of(context).pop();
        },
        child: const Icon(
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
                hintText: 'Journal Heading..   << optional >>',
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
              maxLength: 2000,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText:
                    'What\'s an adventure I had today..\nTap to start writing..',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
