import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magic_calculator/data/JSON_data.dart';

class diary extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());

  int index;
  diary(this.index);

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal"),
        backgroundColor: const Color(0xffFF7276),
        actions: [
          IconButton(
            onPressed: () {},
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
          Text(
            JournalList[index].heading!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(JournalList[index].content!),
          Divider(),
          Text(
            '${DateFormat.jm().format(JournalList[index].dateTime!)} - ${DateFormat.yMMMMEEEEd().format(JournalList[index].dateTime!)}',
            style: TextStyle(color: Color(0xffFF7276)),
          ),
        ]),
      ),
    );
  }
}
