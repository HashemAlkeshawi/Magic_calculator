import 'dart:ui';

import 'package:magic_calculator/data/Journals.dart';

Map<String, dynamic> journals = {
  'name': 'Journal',
  'count': journals_detailed.length,
  'date': DateTime(2022, 7, 9),
  'color': const Color(0xffFF7276),
  'desc':
      'keep a record of your personal thoughts, feelings, insights, and more.',
  'journals': journals_detailed,
};

List<Map<String, dynamic>> journals_detailed = [];

Map<String, dynamic> notes = {
  'name': 'Note',
  'count': 0,
  'date': DateTime(2022, 7, 9),
  'color': const Color(0xff82E0C8),
  'desc':
      'process information.know what to prioritize.learn more about a topic.Improve your organizational skills',
  'Notes': [
    {
      'heading': 'the first',
      'content': 'the first content',
    },
    {
      'heading': 'the second',
      'content': 'the second content',
    },
    {
      'heading': 'the third',
      'content': 'the third content',
    },
    {
      'heading': 'the fourth',
      'content': 'the fourth content',
    },
  ],
};

Map<String, dynamic> todos = {
  'name': 'To-Do',
  'count': 0,
  'date': DateTime(2022, 7, 9),
  'color': const Color(0xff8E8BFF),
  'desc':
      'Make sure that your tasks are written down all in one place so you don\'t forget anything important.',
  'journals': [
    {
      'task': 'the first',
    },
    {
      'task': 'the second',
    },
    {
      'task': 'the third',
    },
    {
      'task': 'the fourth',
    },
  ],
};

List<Journal>? JournalList;

void createJournalsList() {
  List journals_ = journals['journals'];

  JournalList = (journals_).map((e) => Journal.fromJson(e)).toList();
  journals['date'] = DateTime.now();
}
