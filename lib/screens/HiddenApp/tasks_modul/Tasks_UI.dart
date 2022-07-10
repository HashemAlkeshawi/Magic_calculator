import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/JSON_data.dart';

class Tasks_UI extends StatelessWidget {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    journals['journals'].add({'heading': "new"});

    // TODO: implement build
    return Scaffold();
  }
}
