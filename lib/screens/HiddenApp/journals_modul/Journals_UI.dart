import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../data/JSON_FILS/Journal_JSON.dart';
import '../../../widgets/Journal_item_ui.dart';
import '../../../widgets/drawer.dart';
import 'Add_Journal.dart';

class Journals_UI extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());
  List l = [];

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    print(JournalList.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal"),
        backgroundColor: const Color(0xffFF7276),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: drawer(const Color(0xaaFF7276)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF7276),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Journal()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        height: screenHight,
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
            journalsList(screenHight),
          ],
        ),
      ),
    );
  }
}
