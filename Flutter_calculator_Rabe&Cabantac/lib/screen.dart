import 'package:flutter/material.dart';
import 'button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  String _operation = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "0";
        _num1 = 0;
        _num2 = 0;
        _operation = "";
        _output = "0";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        _num1 = double.parse(output);
        _operation = value;
        _output = "0";
      } else if (value == "=") {
        _num2 = double.parse(output);

        if (_operation == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operation == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operation == "*") {
          _output = (_num1 * _num2).toString();
        } else if (_operation == "/") {
          _output = (_num1 / _num2).toString();
        }

        _num1 = 0;
        _num2 = 0;
        _operation = "";
      } else {
        if (output == "0") {
          _output = value;
        } else {
          _output = output + value;
        }
      }

      output = _output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(24.0),
            child: Text(
              output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                CalculatorButton(
                    label: "7",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("7")),
                CalculatorButton(
                    label: "8",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("8")),
                CalculatorButton(
                    label: "9",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("9")),
                CalculatorButton(
                    label: "/",
                    color: Colors.orange,
                    onPressed: () => _buttonPressed("/")),
              ],
            ),
            Row(
              children: [
                CalculatorButton(
                    label: "4",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("4")),
                CalculatorButton(
                    label: "5",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("5")),
                CalculatorButton(
                    label: "6",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("6")),
                CalculatorButton(
                    label: "*",
                    color: Colors.orange,
                    onPressed: () => _buttonPressed("*")),
              ],
            ),
            Row(
              children: [
                CalculatorButton(
                    label: "1",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("1")),
                CalculatorButton(
                    label: "2",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("2")),
                CalculatorButton(
                    label: "3",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("3")),
                CalculatorButton(
                    label: "-",
                    color: Colors.orange,
                    onPressed: () => _buttonPressed("-")),
              ],
            ),
            Row(
              children: [
                CalculatorButton(
                    label: "0",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed("0")),
                CalculatorButton(
                    label: ".",
                    color: Colors.blue,
                    onPressed: () => _buttonPressed(".")),
                CalculatorButton(
                    label: "C",
                    color: Colors.red,
                    onPressed: () => _buttonPressed("C")),
                CalculatorButton(
                    label: "+",
                    color: Colors.orange,
                    onPressed: () => _buttonPressed("+")),
              ],
            ),
            Row(
              children: [
                CalculatorButton(
                    label: "=",
                    color: Colors.green,
                    onPressed: () => _buttonPressed("=")),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
