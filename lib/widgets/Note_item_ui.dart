import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:magic_calculator/screens/HiddenApp/notes_modul/Edit_Note.dart';

import '../data/JSON_FILS/Note_JSON.dart';
import '../screens/HiddenApp/notes_modul/note.dart';

class NoteGridList extends StatefulWidget {
  double screenHieght;
  NoteGridList(this.screenHieght);

  @override
  State<NoteGridList> createState() => _NoteGridListState();
}

class _NoteGridListState extends State<NoteGridList> {
  List l = [];

  @override
  Widget build(BuildContext context) {
    return NoteList.isEmpty
        ? Container(
            height: widget.screenHieght / 1.5,
            child: Lottie.asset('assets/animations/empty_note.json'))
        : GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: const EdgeInsets.symmetric(vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: NoteList.length,
            itemBuilder: ((context, input) {
              int index = NoteList.length - (input + 1);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => note(index)));
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                  child: GridTile(
                    header: Container(
                      child: Text(
                        NoteList[index].content!.length < 29
                            ? NoteList[index].content!
                            : '${NoteList[index].content!.substring(0, 30)}...',
                      ),
                    ),
                    child: Container(
                      child: Text(
                        NoteList[index].heading!.length < 18
                            ? NoteList[index].heading!
                            : '${NoteList[index].heading!.substring(0, 17)}...',
                      ),
                    ),
                    footer: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            NoteList.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
  }
}
