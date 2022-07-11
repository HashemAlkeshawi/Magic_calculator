import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/JSON_FILS/Journal_JSON.dart';
import '../../../widgets/drawer.dart';

class Tasks_UI extends StatelessWidget {
  String date = DateUtils.dateOnly(DateTime.now()).toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Color(0xff8E8BFF),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: drawer(Color(0xaa8E8BFF)),
    );
  }
}
