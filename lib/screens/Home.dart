import 'package:flutter/material.dart';

import '../widgets/Calculator.dart';

class Magic_calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff951BDB),
        title: const Text("Magic Calculator"),
      ),
      body: Calculator(),
    );
  }
}
