import 'package:zcalcul/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatriceState();
  }
}

class _CalculatriceState extends State<Calculatrice> {
  String _input = '';
  String _output = '';
  String _ans = '';

  void updateInput(String newInput) {
    setState(() {
      _input += newInput;
    });
  }

  void resetInput() {
    setState(() {
      _input = '';
      _output = '';
    });
  }

  void updateOutput() {
    Parser p = Parser();
    ContextModel cm = ContextModel();
    if (_input.isEmpty) {
      _input = '0';
    }
    String expression = _input.replaceAll('x', '*');

    try {
      if (expression.contains('%1') ||
          expression.contains('%2') ||
          expression.contains('%3') ||
          expression.contains('%4') ||
          expression.contains('%5') ||
          expression.contains('%6') ||
          expression.contains('%7') ||
          expression.contains('%8') ||
          expression.contains('%9') ||
          expression.contains('%0') ||
          expression.contains('%%') ||
          expression.contains('%.') ||
          expression.contains('.%')) {
        throw Error;
      } else {
        expression = expression.replaceAll('%', '/100');
      }
      Expression exp = p.parse(expression);
      double result = exp.evaluate(EvaluationType.REAL, cm);
      _ans = result.toString();
      setState(() {
        _output = result.toString();
      });
    } catch (e) {
      setState(() {
        _output = 'Expression Invalide';
      });
    }
  }

  void deleteInput() {
    setState(() {
      if (_input.isEmpty) {
        _input = _input;
      } else {
        _input = _input.substring(0, _input.length - 1);
      }
    });
  }

  void printAnswer() {
    setState(() {
      _input = _ans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(color: Colors.black),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  _input,
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(color: Colors.black),
              child: Text(
                _output,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Keyboard(
                onDeleteInput: deleteInput,
                onResetInput: resetInput,
                onUpdateInput: updateInput,
                onUpdateOutput: updateOutput,
                onPressAns: printAnswer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
