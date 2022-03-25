import 'package:calculator/calculator.dart';
import 'package:calculator_app_testing/home_page.dart';
import 'package:calculator_app_testing/inherited_widgets/inherited_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CalculatorApp(
      calculator: Calculator(),
    ),
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({
    Key? key,
    required this.calculator,
  }) : super(key: key);

  final Calculator calculator;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: InheritedCalculator(
        calculator: calculator,
        child: const HomePage(),
      ),
    );
  }
}
