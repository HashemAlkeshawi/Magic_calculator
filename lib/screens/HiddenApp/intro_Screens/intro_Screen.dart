import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_Screen extends StatelessWidget {
  TextEditingController operand1_controller = TextEditingController();

  TextEditingController operand2_controller = TextEditingController();

  TextEditingController operand3_controller = TextEditingController();

  PageViewModel page_1 = PageViewModel(
    title: '',
    body: "page_1_body".tr(),
    image: Container(
      margin: const EdgeInsets.only(top: 20),
      child: Image.asset(
        'assets/images/introPageOne.png',
      ),
    ),
  );
  PageViewModel page_2 = PageViewModel(
      title: '',
      body: "page_2_body".tr(),
      image: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Image.asset('assets/images/introPageTwo.png'),
      ));
  PageViewModel page_3 = PageViewModel(
      title: '',
      body: "page_3_body".tr(),
      image: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Image.asset('assets/images/introPageThree.png'),
      ));
  page_4(List<TextEditingController> Controllers) {
    PageViewModel page_4 = PageViewModel(
      title: '',
      bodyWidget: setPassEquationWidget(
        Controllers,
      ), // "page_3_body".tr(),
      image: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "${'page_4_rule_1'.tr()}  \n ${'page_4_rule_1'.tr()} \n ${'page_4_rule_1'.tr()}\n ${'page_4_rule_1'.tr()}  \n ${'page_4_rule_1'.tr()}",
        ),
      ),
    );
    return page_4;
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenheight,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, bottom: 30),
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        next: Icon(Icons.arrow_forward),
        onDone: () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          List<String> equation = [
            operand1_controller.text,
            operand2_controller.text,
            operand3_controller.text
          ];

          sharedPreferences.setStringList('passEquation', equation);
          ScaffoldMessenger.of(context).showSnackBar(Snackbar());

          Navigator.of(context).pop();
          print("Done");
        },
        done: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("Done"),
        ),
        pages: [
          page_1,
          page_2,
          page_3,
          page_4(
              [operand1_controller, operand2_controller, operand3_controller]),
        ],
      ),
    );
  }
}

setPassEquationWidget(List<TextEditingController> controllers) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "setEquation".tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: controllers[0],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "First Number".tr(),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: controllers[1],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Sign".tr(),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: controllers[2],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Second Number".tr(),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Snackbar() {
  return SnackBar(
    content: Text("passEquation Changed".tr()),
    duration: Duration(milliseconds: 2500),
    backgroundColor: Color(0xff0BB300),
  );
}
