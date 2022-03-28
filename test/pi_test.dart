import 'package:calculator/calculator.dart';
import 'package:calculator_app_testing/pi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('Pi', () {
    testWidgets('renders the result provided by the calculator',
        (tester) async {
      when(calculator.pi()).thenAnswer(
        (realInvocation) =>
            Stream.periodic(const Duration(milliseconds: 400), (eventIndex) {
          if (eventIndex == 0) return 3.1;
          if (eventIndex == 1) return 3.14;
          return 0;
        }),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pi(calculator: calculator),
          ),
        ),
      );
      expect(find.text('Calculating pi...'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(find.text('The latest known value of pi is 3.1'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(find.text('The latest known value of pi is 3.14'), findsOneWidget);
    });
  });
}
