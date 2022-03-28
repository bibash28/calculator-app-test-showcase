import 'package:calculator/calculator.dart';
import 'package:calculator_app_testing/operation.dart';
import 'package:calculator_app_testing/two_digit_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

//with mockito we can control the behaviour of the dependencies
class MockCalculator extends Mock implements Calculator {}

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets(
        'paints value returned by the calculator',
        (tester) async {
          when(calculator.add(3, 1)).thenReturn(25);
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: TwoDigitOperation(
                  operation: Operation.add,
                  calculator: calculator,
                ),
              ),
            ),
          );
          await tester.enterText(
            find.byKey(const Key('textField_top_plus')),
            '3',
          );
          await tester.enterText(
            find.byKey(const Key('textField_bottom_plus')),
            '1',
          );
          await tester.pumpAndSettle();
          expect(find.text('is 25.0'), findsOneWidget);
        },
      );
    });
  });
}
