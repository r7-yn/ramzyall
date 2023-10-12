
import 'package:flutter/material.dart';
import 'package:first/Dashboard.dart';
import 'package:first/drwer2.dart';
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
  
      backgroundColor: Color.fromARGB(255, 45, 120, 232),
      actions: [
      
      IconButton(onPressed: () => Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        myhome()
  
        )), icon: Icon(Icons.arrow_circle_left_sharp) ,)

      ],
        

      ),

body: CalculatorScreen(),
drawer: drw(),
    
);
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<double> numbers = [];
  List<double> numbers1 = [];
  String operation = '';
  double result = 0.0;

  String pross = "";
  int dots = 0;
  double n = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text('$pross  $result ',
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () => addNumber(1),
                child: Text("1"),
              )),
              //child: NumberButton(1, onPressed: () => )),
              Expanded(
                  child: ElevatedButton(
                      child: Text('2'), onPressed: () => addNumber(2))),
              Expanded(
                  child: ElevatedButton(
                      child: Text('3'), onPressed: () => addNumber(3))),
              Expanded(
                  child: ElevatedButton(
                      child: Text('/'), onPressed: () => setOperation('/'))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                      child: Text("4"), onPressed: () => addNumber(4))),
              Expanded(
                child: ElevatedButton(
                    child: Text("5"), onPressed: () => addNumber(5)),
              ),
              Expanded(
                  child: ElevatedButton(
                      child: Text("6"), onPressed: () => addNumber(6))),
              Expanded(
                  child: ElevatedButton(
                      child: Text('*'), onPressed: () => setOperation('*'))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                    child: Text("7"), onPressed: () => addNumber(7)),
              ),
              Expanded(
                  child: ElevatedButton(
                      child: Text("8"), onPressed: () => addNumber(8))),
              Expanded(
                  child: ElevatedButton(
                      child: Text("9"), onPressed: () => addNumber(9))),
              Expanded(
                child: ElevatedButton(
                    child: Text('-'), onPressed: () => setOperation('-')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                      child: Text('.'), onPressed: () => setOperation('.'))),
              Expanded(
                  child: ElevatedButton(
                      child: Text("0"), onPressed: () => addNumber(0))),
              Expanded(
                child: ElevatedButton(
                    child: Text("00"), onPressed: () => addNumber(00)),
              ),
              Expanded(
                child: ElevatedButton(
                    child: Text('+'), onPressed: () => setOperation('+')),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: clearNumbers, child: Text('Clear'))),
              Expanded(
                child: ElevatedButton(
                  onPressed: calculateResult,
                  child: Text('='),
                ),
              ),
            ],
          ),
        ]));
  }

  void addNumber(int number) {
    setState(() {
      if (dots == 0 && operation == '') {
        numbers.add(number.toDouble());
        pross += number.toString();
      } else if (dots == 0) {
        numbers1.add(number.toDouble());
        pross += number.toString();
      } else if (operation == '') {
        numbers[numbers.length - 1] =
            numbers[numbers.length - 1] + (number * 0.10);
        print(((number * 0.10)));
        print(numbers[0]);
        pross += number.toString();
      } else {
        numbers1[numbers1.length - 1] =
            (numbers1[numbers1.length - 1].toDouble() + (number * 0.10));
        pross += number.toString();
      }
    });
  }

  void setOperation(String op) {
    setState(() {
      if (op == ".") {
        dots = 1;
        print(dots);

        pross += op;
      } else if (dots == 1) {
        dots = 0;
        print(dots);
        operation = op;
        pross += op;
      } else {
        print(dots);
        operation = op;
        pross += op;
      }
    });
  }

  void calculateResult() {
    setState(() {
      double sum1 = numbers[numbers.length - 1];
      double sum2 = numbers1[numbers1.length - 1];

      int n = 10;
      for (int i = numbers.length - 2; i >= 0; i--) {
        sum1 += numbers[i] * n;
        n *= 10;
      }
      n = 10;
      for (int i = numbers1.length - 2; i >= 0; i--) {
        sum2 += numbers1[i] * n;
        n *= 10;
      }
      print('$sum1 $sum2');
      switch (operation) {
        case '+':
          result = (sum1 + sum2);

          break;
        case '-':
          result = (sum1 - sum2);
          break;
        case '*':
          result = (sum1 * sum2);
          break;
        case '/':
          result = sum1 / sum2;
          break;
      }
      pross += "=";
    });
  }

  void clearNumbers() {
    setState(() {
      numbers.clear();
      numbers1.clear();
      operation = '';
      result = 0.0;
      pross = "";
    });
  }
}
