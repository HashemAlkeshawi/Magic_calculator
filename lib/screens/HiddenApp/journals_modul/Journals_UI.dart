import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'package:magic_calculator/data/JSON_data.dart';
import 'package:magic_calculator/screens/HiddenApp/journals_modul/diary.dart';

import '../../../data/Journals.dart';
import '../../../widgets/drawer.dart';
import 'Add_Journal.dart';
import 'Edit_Journal.dart';

class Journals_UI extends StatelessWidget {
  String date = DateFormat.yMMMEd().format(DateTime.now());
  List l = [];

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    print(journals_detailed.length);

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

  Widget journalsList(double screenHieght) {
    return journals_detailed.isEmpty
        ? Container(
            height: screenHieght / 1.5,
            child: Lottie.asset('assets/animations/empty_journals.json'))
        : ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (JournalList ?? l).length,
            itemBuilder: ((context, input) {
              int index = JournalList!.length - (input + 1);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => diary(index)));
                },
                child: Container(
                  height: 100,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        JournalList![index].heading!.length < 18
                            ? JournalList![index].heading!
                            : '${JournalList![index].heading!.substring(0, 17)}...',
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(JournalList![index].dateTime!),
                      style: const TextStyle(color: const Color(0xffFF7276)),
                    ),
                    trailing: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat.jm()
                                .format(JournalList![index].dateTime!),
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                              splashColor: Colors.grey,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Edit_Journal(index)));
                              },
                              child: const Icon(Icons.edit)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
  }
}
