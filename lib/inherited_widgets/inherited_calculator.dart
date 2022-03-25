import 'package:calculator/calculator.dart';
import 'package:flutter/widgets.dart';

class InheritedCalculator extends InheritedWidget {
  const InheritedCalculator({
    Key? key,
    required this.calculator,
    required Widget child,
  }) : super(key: key, child: child);

  final Calculator calculator;

  static InheritedCalculator of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCalculator>()!;
  }

  @override
  bool updateShouldNotify(InheritedCalculator oldWidget) =>
      calculator != oldWidget.calculator;
}
