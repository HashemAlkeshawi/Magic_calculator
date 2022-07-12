import 'dart:ui';

import 'package:magic_calculator/widgets/Journal_item_ui.dart';

import '../dataClasses/Journals.dart';
import '../dataClasses/Notes.dart';

Map<String, dynamic> journals = {
  'name': 'Journal',
  'count': JournalList.length,
  'date': DateTime,
  'color': const Color(0xffFF7276),
  'desc':
      'keep a record of your personal thoughts, feelings, insights, and more.',
};

List<Journal> JournalList = [];

addJournal(Journal journal) {
  journals['date'] = DateTime.now();
  JournalList.add(journal);
}

//   
