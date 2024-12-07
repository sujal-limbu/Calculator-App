// ignore_for_file: non_constant_identifier_names

import 'package:calculator/Button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Questionasked = '';
  var QuestionAnswered = '';

  List buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Questionasked,
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      QuestionAnswered,
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: Center(
                    child: GridView.builder(
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return MyButton(
                                buttonpressed: () {
                                  setState(() {
                                    Questionasked = '';
                                  });
                                },
                                Color: Colors.purple,
                                textcolor: Colors.white,
                                buttonText: buttons[index]);
                          } else if (index == 1) {
                            return MyButton(
                                buttonpressed: () {
                                  setState(() {
                                    Questionasked = Questionasked.substring(
                                        0, Questionasked.length - 1);
                                  });
                                },
                                Color: Colors.red,
                                textcolor: Colors.white,
                                buttonText: buttons[index]);
                          } else if (index == buttons.length - 1) {
                            return MyButton(
                                buttonpressed: () {
                                  setState(() {
                                    equalsTo();
                                  });
                                },
                                Color: Colors.deepPurple,
                                textcolor: Colors.white,
                                buttonText: buttons[index]);
                          } else if (index == buttons.length - 2) {
                            return MyButton(
                                buttonpressed: () {
                                  setState(() {
                                    Ans();
                                  });
                                },
                                Color: Colors.deepPurple,
                                textcolor: Colors.white,
                                buttonText: buttons[index]);
                          } else {
                            return MyButton(
                                buttonpressed: () {
                                  setState(() {
                                    Questionasked += buttons[index];
                                  });
                                },
                                Color: isOperator(buttons[index])
                                    ? Colors.deepPurple
                                    : Colors.deepOrange[200],
                                textcolor: Colors.white,
                                buttonText: buttons[index]);
                          }
                        })),
              ))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '+' || x == '-' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalsTo() {
    setState(() {
      String Answer = Questionasked;
      Answer = Answer.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(Answer);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      QuestionAnswered = eval.toString();
    });
  }

  void Ans() {
    setState(() {
      Questionasked += QuestionAnswered;
    });
  }
}
