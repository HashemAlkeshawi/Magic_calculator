import 'dart:ui';

import '../dataClasses/Journals.dart';

Map<String, dynamic> journals = {
  'name': 'Journal',
  'date': DateTime.now(),
  'color': const Color(0xffFF7276),
  'desc':
      'keep a record of your personal thoughts, feelings, insights, and more.',
  'journals': [
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
  ],
};

List<Map<String, dynamic>> Journals = journals['journals'];

List<Journal> JournalList = Journals.map((e) => Journal.fromJson(e)).toList();

addJournal(Journal journal) {
  journals['date'] = DateTime.now();
  JournalList.add(journal);
}
