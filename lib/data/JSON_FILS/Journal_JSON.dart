import 'dart:ui';

import '../dataClasses/Journals.dart';

Map<String, dynamic> journals = {
  'name': 'Journal',
  'count': journals_detailed.length,
  'date': DateTime,
  'color': const Color(0xffFF7276),
  'desc':
      'keep a record of your personal thoughts, feelings, insights, and more.',
  'journals': journals_detailed,
};

List<Map<String, dynamic>> journals_detailed = [];

List<Journal>? JournalList;

void createJournalsList() {
  List journals_ = journals['journals'];

  JournalList = (journals_).map((e) => Journal.fromJson(e)).toList();
  journals['date'] = DateTime.now();
}
