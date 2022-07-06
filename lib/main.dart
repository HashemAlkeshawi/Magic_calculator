import 'package:flutter/material.dart';
import 'package:magic_calculator/screens/Home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Magic_calculator(),
    );
  }
}
