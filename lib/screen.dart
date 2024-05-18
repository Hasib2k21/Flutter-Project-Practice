import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    final double? num1 = double.tryParse(_controller1.text);
    final double? num2 = double.tryParse(_controller2.text);

    if (num1 == null || num2 == null) {
      _showResultDialog('Invalid input');
      return;
    }

    double result;
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          _showResultDialog('Cannot divide by zero');
          return;
        }
        result = num1 / num2;
        break;
      case '%':
        result = (num1 / 100) * num2;
        break;
      default:
        _showResultDialog('Invalid operation');
        return;
    }

    _showResultDialog('Result: $result');
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first number',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('%'),
                  child: Text('%'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
