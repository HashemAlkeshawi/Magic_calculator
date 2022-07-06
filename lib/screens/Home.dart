import 'package:flutter/material.dart';

class Magic_calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Calculator(),
    );
  }
}

enum Operator { sum, sub, div, mult }

class Calculator extends StatefulWidget {
  String First_index = "";
  String Second_index = "";

  Operator? operator;

  List<dynamic> operation = [];

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.operation.toString()),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.remove),
                          Text("Clear"),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (widget.operation.length == 1 ||
                                widget.operation.isEmpty) {
                              widget.First_index += '1';
                              widget.operation.first(widget.First_index);
                            } else {
                              widget.Second_index;
                              widget.operation.add(widget.Second_index);
                            }
                            setState(() {});
                          },
                          child: Container(
                            child: Text("1"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
