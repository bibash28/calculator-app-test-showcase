import 'package:calculator/calculator.dart';
import 'package:calculator_app_testing/operation.dart';
import 'package:calculator_app_testing/pi.dart';
import 'package:calculator_app_testing/power_of_two.dart';
import 'package:calculator_app_testing/two_digit_operation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Calculators'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                PowerOfTwo(calculator: calculator),
                const Divider(),
                Pi(calculator: calculator),
                const Divider(),
                TwoDigitOperation(
                  calculator: calculator,
                  operation: Operation.add,
                ),
                const Divider(),
                TwoDigitOperation(
                  calculator: calculator,
                  operation: Operation.subtract,
                ),
                const Divider(),
                TwoDigitOperation(
                  calculator: calculator,
                  operation: Operation.multiply,
                ),
                const Divider(),
                TwoDigitOperation(
                  calculator: calculator,
                  operation: Operation.divide,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
