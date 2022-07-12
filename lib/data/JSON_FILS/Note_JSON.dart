import 'dart:ui';

import 'package:magic_calculator/data/dataClasses/Notes.dart';

Map<String, dynamic> notes = {
  'name': 'Note',
  'count': noteList.length,
  'date': DateTime.now(),
  'color': const Color(0xff82E0C8),
  'desc':
      'process information.know what to prioritize.learn more about a topic.Improve your organizational skills',
};

List<Note> noteList = [];

addNote(Note note) {
  notes['date'] = DateTime.now();
  noteList.add(note);
}
