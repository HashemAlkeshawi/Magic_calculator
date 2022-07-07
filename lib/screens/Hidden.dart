import 'package:flutter/material.dart';

class Hidden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff951BDB),
        title: const Text("Magic Calculator"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 34,
          left: 12,
          right: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "This is the Hidden Page!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 90,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0x222310E8),
                        border: Border.all(
                          color: Color(0xff6211F2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text("Secret N. ${index + 1}"),
                        subtitle: Text('Hashem Alkeshawi'),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.assignment_late,
                          ),
                          backgroundColor: Color(0xff6211F2),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
