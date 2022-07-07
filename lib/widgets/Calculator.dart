import 'dart:ffi';

import 'package:flutter/material.dart';

import '../screens/Hidden.dart';

enum Operator { sum, sub, div, mult, equal }

class Calculator extends StatefulWidget {
  String First_index = "";
  String Second_index = "";

  Operator? operator;

  List<dynamic> operation = [""];

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<dynamic> passEquation = ['3.15', '+', '2001'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                ),
                const BoxShadow(
                  color: Colors.white,
                  spreadRadius: -1.0,
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: Screen(widget.operation),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(3),
                        height: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff2310E8))),
                          onPressed: () {
                            Clear();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.clear_all),
                              Text("Clear"),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          nomberButton(1),
                          nomberButton(2),
                          nomberButton(3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          nomberButton(4),
                          nomberButton(5),
                          nomberButton(6),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          nomberButton(7),
                          nomberButton(8),
                          nomberButton(9),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          nomberButton(0),
                          operatorButton(Operator.mult),
                          operatorButton(Operator.div),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      backSpaceButton(),
                      operatorButton(Operator.sum),
                      operatorButton(Operator.sub),
                      equalButton(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Screen(List<dynamic> operation) {
    String first_operand = '0';
    String operator = '';
    String second_operand = '';
    if (operation.length == 0) {
      first_operand = '0';
    } else if (operation.length == 1) {
      first_operand = '${operation[0]}';
    } else if (operation.length == 2) {
      first_operand = '${operation[0]}';
      operator = '${operation[1]}';
    } else if (operation.length == 3) {
      first_operand = '${operation[0]}';
      operator = '${operation[1]}';
      second_operand = '${operation[2]}';
    }

    return Text(
        "${first_operand == '' ? '0' : first_operand} $operator $second_operand");
  }

  Widget backSpaceButton() {
    return Container(
      margin: EdgeInsets.all(3),
      height: 60,
      width: 75,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff2310E8))),
        onPressed: () {
          if (widget.operation.length == 1 || widget.operation.isEmpty) {
            widget.First_index =
                '${widget.First_index.substring(0, widget.First_index.length > 0 ? widget.First_index.length - 1 : 0)}';
            widget.operation[0] = (widget.First_index);
          } else if (widget.operation.length == 2) {
            widget.operation.removeLast();
          } else if (widget.operation.length == 3) {
            widget.Second_index =
                '${widget.Second_index.substring(0, widget.Second_index.length > 0 ? widget.Second_index.length - 1 : 0)}';
            widget.operation[2] = (widget.Second_index);
            if (widget.Second_index == '') {
              widget.operation.removeLast();
            }
          }
          setState(() {});
        },
        child: Container(
          child: Icon(Icons.backspace),
        ),
      ),
    );
  }

  Widget nomberButton(int nomber) {
    return Container(
      margin: EdgeInsets.all(3),
      height: 70,
      width: 80,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff6211F2))),
        onPressed: () {
          onNomberClicked(nomber);
          setState(() {});
        },
        child: Container(
          child: Text("$nomber"),
        ),
      ),
    );
  }

  Widget operatorButton(Operator operator) {
    return Container(
      margin: EdgeInsets.all(3),
      height: 70,
      width: 75,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff2310E8))),
        onPressed: () {
          onOperatorClicked(operator);
          setState(() {});
        },
        child: Container(
          child: Text(operatorIcon(operator)),
        ),
      ),
    );
  }

  Clear() {
    widget.operation.clear();
    widget.First_index = '';
    widget.Second_index = '';
    widget.operation.add("");
    setState(() {});
  }

  onNomberClicked(dynamic input) {
    if (widget.operation.length == 1 || widget.operation.isEmpty) {
      widget.First_index += '$input';
      widget.operation[0] = (widget.First_index);
    } else if (widget.operation.length == 2) {
      widget.Second_index += '$input';
      widget.operation.add(widget.Second_index);
    } else if (widget.operation.length == 3) {
      widget.Second_index += '$input';
      widget.operation[2] = (widget.Second_index);
    }
  }

  onOperatorClicked(Operator input) {
    if (widget.operation.isEmpty || widget.operation.first == "") {
    } else if (widget.operation.length == 1) {
      widget.operator = input;
      widget.operation.add(operatorIcon(input));
    } else {}
  }

  String operatorIcon(Operator operator) {
    return operator == Operator.div
        ? ('÷')
        : operator == Operator.mult
            ? ('×')
            : operator == Operator.sub
                ? ('-')
                : operator == Operator.sum
                    ? ('+')
                    : operator == Operator.equal
                        ? ('=')
                        : ("");
  }

  Widget equalButton() {
    return Container(
      margin: EdgeInsets.all(3),
      height: 146,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff0BB300))),
        onPressed: () {
          onequalClicked(widget.operation);
          setState(() {});
        },
        child: Container(
          child: Text(operatorIcon(Operator.equal)),
        ),
      ),
    );
  }

  onequalClicked(List<dynamic> operation) {
    print(passEquation.toString());
    if (operation.toString() == passEquation.toString()) {
      operation.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Hidden()));

      print("Done!");
    } else if (operation.length == 1 || operation.length == 2) {
    } else if (operation.length == 3) {
      if (operation[1] == "+") {
        String temp = (sum(operation[0], operation[2]));
        widget.operation.clear();
        widget.operation.add(temp);
      } else if (operation[1] == "-") {
        String temp = (sub(operation[0], operation[2]));
        widget.operation.clear();
        widget.operation.add(temp);
      } else if (operation[1] == "÷") {
        String temp = (div(operation[0], operation[2]));
        widget.operation.clear();
        widget.operation.add(temp);
      } else if (operation[1] == "×") {
        String temp = (mult(operation[0], operation[2]));
        widget.operation.clear();
        widget.operation.add(temp);
      } else {}
    }
    widget.First_index = '';
    widget.Second_index = '';
  }

  String sum(x, y) {
    return (double.parse(x) + double.parse(y)).toString();
  }

  String sub(x, y) {
    return (double.parse(x) - double.parse(y)).toString();
  }

  String mult(x, y) {
    return (double.parse(x) * double.parse(y)).toString();
  }

  String div(x, y) {
    if (int.parse(y) != 0) {
      return (double.parse(x) / double.parse(y)).toString();
    } else {
      return "Can not divide by Zero";
    }
  }
}
