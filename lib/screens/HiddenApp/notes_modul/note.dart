import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

import '../../../data/JSON_FILS/Note_JSON.dart';
import 'Edit_Note.dart';
import 'Notes_UI.dart';

class note extends StatelessWidget {
  GlobalKey previewContainer = new GlobalKey();

  String date = DateFormat.yMMMEd().format(DateTime.now());

  int index;
  note(this.index);

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff82E0C8),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Edit_Note(index)));
          },
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 30,
          ),
        ),
        appBar: AppBar(
          title: const Text("Note"),
          backgroundColor: const Color(0xff82E0C8),
          actions: [
            IconButton(
              onPressed: () {
                noteList.removeAt(index);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Notes_UI()));
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                ShareFilesAndScreenshotWidgets().shareScreenshot(
                    previewContainer, 100, "Title", "Name.png", "image/png",
                    text: "This is the caption!");
              },
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: NoteBody(previewContainer));
  }

  Widget NoteBody(previewContainer) {
    return RepaintBoundary(
      key: previewContainer,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: ListView(shrinkWrap: true, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              noteList[index].heading!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(noteList[index].content!),
          Divider(),
          Text(
            '${DateFormat.jm().format(noteList[index].dateTime!)} - ${DateFormat.yMMMMEEEEd().format(noteList[index].dateTime!)}',
            style: TextStyle(color: Color(0xff82E0C8)),
          ),
        ]),
      ),
    );
  }
}
