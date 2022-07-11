import 'dart:ui';

import 'package:magic_calculator/data/dataClasses/Notes.dart';

Map<String, dynamic> notes = {
  'name': 'Note',
  'count': 0,
  'date': DateTime.now(),
  'color': const Color(0xff82E0C8),
  'desc':
      'process information.know what to prioritize.learn more about a topic.Improve your organizational skills',
  'Notes': notes_detailed,
};

List<Map<String, dynamic>> notes_detailed = [];

List<Note>? NoteList;

void createNotesList() {
  List notes_ = notes['Notes'];

  NoteList = (notes_).map((e) => Note.fromJson(e)).toList();
  notes['date'] = DateTime.now();
}
