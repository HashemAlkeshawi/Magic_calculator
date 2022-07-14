import 'package:flutter/material.dart';
import 'package:magic_calculator/screens/HiddenApp/journals_modul/Journals_UI.dart';
import 'package:magic_calculator/screens/HiddenApp/notes_modul/Notes_UI.dart';
import 'package:magic_calculator/screens/HiddenApp/tasks_modul/Tasks_UI.dart';
import 'package:magic_calculator/screens/calculator.dart';

import '../screens/HiddenApp/home.dart';

class drawer extends StatelessWidget {
  Color color;
  drawer(this.color);
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: color),
        child: Drawer(
          width: 240,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Journals_UI()));
                  },
                  title: Text(
                    "Journal",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Icons.book_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    backgroundColor: Color(0xffFF7276),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Notes_UI()));
                  },
                  title: Text(
                    "Notes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Icons.note_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    backgroundColor: Color(0xff82E0C8),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Tasks_UI()));
                  },
                  title: Text(
                    "To-Do",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Icons.checklist,
                      color: Colors.white,
                      size: 30,
                    ),
                    backgroundColor: Color(0xff8E8BFF),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                // Spacer(),

                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  title: Text(
                    "Apps",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.dashboard,
                    size: 50,
                    color: Colors.white,
                  ),
                ),

                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Magic_calculator()));
                  },
                  title: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
