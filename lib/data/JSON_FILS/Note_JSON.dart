import 'dart:ui';

import 'package:magic_calculator/data/dataClasses/Notes.dart';

Map<String, dynamic> notes = {
  'name': 'Note',
  'count': 0,
  'date': DateTime.now(),
  'color': const Color(0xff82E0C8),
  'desc':
      'process information.know what to prioritize.learn more about a topic.Improve your organizational skills',
};

List<Map<String, dynamic>> notesDetailed = [];

List<Note> NoteList = (notesDetailed).map((e) => Note.fromJson(e)).toList();
