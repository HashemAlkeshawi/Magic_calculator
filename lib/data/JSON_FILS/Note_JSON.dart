import 'dart:ui';

import 'package:magic_calculator/data/dataClasses/Notes.dart';

Map<String, dynamic> notes = {
  'name': 'Note',
  'date': DateTime.now(),
  'color': const Color(0xff82E0C8),
  'desc':
      'process information.know what to prioritize.learn more about a topic.Improve your organizational skills',
  'notes': [
    {
      'heading': "First heading",
      'content': "First Content",
      'datetime': DateTime.now()
    },
    {
      'heading': "Second heading",
      'content': "Second Content",
      'datetime': DateTime.now()
    },
  ]
};

List<Map<String, dynamic>> Notes = notes['notes'];

List<Note> noteList = Notes.map((e) => Note.fromJson(e)).toList();

addNote(Note note) {
  notes['date'] = DateTime.now();
  noteList.add(note);
}
