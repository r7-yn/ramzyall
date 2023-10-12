import 'package:flutter/material.dart';





class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<int> numbers = [0, 0];
  String operation = '+';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberButton(1, onPressed: () => addNumber(1)),
                NumberButton(2, onPressed: () => addNumber(2)),
                NumberButton(3, onPressed: () => addNumber(3)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberButton(4, onPressed: () => addNumber(4)),
                NumberButton(5, onPressed: () => addNumber(5)),
                NumberButton(6, onPressed: () => addNumber(6)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberButton(7, onPressed: () => addNumber(7)),
                NumberButton(8, onPressed: () => addNumber(8)),
                NumberButton(9, onPressed: () => addNumber(9)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OperationButton('+', onPressed: () => setOperation('+')),
                OperationButton('-', onPressed: () => setOperation('-')),
                OperationButton('*', onPressed: () => setOperation('*')),
                OperationButton('/', onPressed: () => setOperation('/')),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  void addNumber(int number) {
    setState(() {
      numbers[0] = numbers[1];
      numbers[1] = number;
    });
  }

  void setOperation(String op) {
    setState(() {
      operation = op;
    });
  }

  void calculateResult() {
    setState(() {
      switch (operation) {
        case '+':
          result = (numbers[0] + numbers[1]) as double;
          break;
        case '-':
          result = (numbers[0] - numbers[1]) as double;
          break;
        case '*':
          result = (numbers[0] * numbers[1]) as double;
          break;
        case '/':
          result = numbers[0] / numbers[1];
          break;
      }
    });
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  NumberButton(this.number, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(number.toString()),
    );
  }
}

class OperationButton extends StatelessWidget {
  final String operation;
  final VoidCallback onPressed;

  OperationButton(this.operation, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(operation),
    );
  }
}