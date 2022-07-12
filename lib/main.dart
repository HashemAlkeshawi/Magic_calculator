import 'package:flutter/material.dart';
import 'package:magic_calculator/screens/HiddenApp/home.dart';
import 'package:magic_calculator/screens/calculator.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
