import 'dart:ui';

import '../dataClasses/Journals.dart';

Map<String, dynamic> journals = {
  'name': 'Journal',
  'date': DateTime.now(),
  'color': const Color(0xffFF7276),
  'desc':
      'keep a record of your personal thoughts, feelings, insights, and more.',
};

List<Journal> JournalList = [];

addJournal(Journal journal) {
  journals['date'] = DateTime.now();
  JournalList.add(journal);
}
