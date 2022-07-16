import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magic_calculator/main.dart';

import 'package:magic_calculator/screens/HiddenApp/journals_modul/Journals_UI.dart';

class Settings extends StatelessWidget {
  TextEditingController operand1_controller = TextEditingController();
  TextEditingController operand2_controller = TextEditingController();
  TextEditingController operand3_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff951BDB),
        title: Text('Home'.tr()),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return Journals_UI();
              })));
            },
            child: Container(
              width: double.infinity,
              height: screenHeight,
              child: ListView(
                children: [
                  // ListTile(
                  //   minLeadingWidth: 4,
                  //   onTap: () {
                  //     App.changeTheme;
                  //   },
                  //   leading: Switch(
                  //     onChanged: (bool value) {},
                  //     value: false,
                  //   ),
                  //   title: Text("Dark Mood".tr()),
                  // ),

                  ListTile(
                    minLeadingWidth: 4,
                    onTap: () {
                      if (context.locale == Locale('en')) {
                        context.setLocale(Locale('ar'));
                        print(context.locale.toString());
                      } else {
                        context.setLocale(Locale('en'));
                      }
                    },
                    leading: Icon(
                      Icons.language,
                      size: 35,
                    ),
                    title: Text("Language".tr()),
                  ),
                  ListTile(
                    minLeadingWidth: 4,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("change password".tr()),
                              content: SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                    Text("Enter Old PassEquation".tr()),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth / 5,
                                          child: TextField(
                                            controller: operand1_controller,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth / 5,
                                          child: TextField(
                                            controller: operand2_controller,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth / 5,
                                          child: TextField(
                                            controller: operand3_controller,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    leading: Icon(
                      Icons.change_circle,
                      size: 35,
                    ),
                    title: Text("change password".tr()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
