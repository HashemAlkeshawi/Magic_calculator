import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/JSON_data.dart';
import '../../../widgets/drawer.dart';

class Notes_UI extends StatelessWidget {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    journals['journals'].add({'heading': "new"});

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Color(0xff82E0C8),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: drawer(Color(0xaa82E0C8)),
    );
  }
}
