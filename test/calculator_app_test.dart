import 'package:calculator_app_testing/main.dart';
import 'package:calculator_app_testing/two_digit_operation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator App', () {
    testWidgets('renders four widgets of type TwoDigitalOperation',
        (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('shows result when given two numbers', (tester) async {
      await tester.pumpWidget(const CalculatorApp());
      // await tester.enterText(
      //   find.byKey(const Key('textField_top_plus')),
      //   '3',
      // );
      // await tester.enterText(
      //   find.byKey(const Key('textField_bottom_plus')),
      //   '6',
      // );

      final topTextFieldFinder = find.byKey(const Key('textField_top_plus'));
      final bottomTextFieldFinder =
          find.byKey(const Key('textField_bottom_plus'));

      //ensure that widget is visible in scrollable view
      await tester.ensureVisible(topTextFieldFinder);
      await tester.tap(topTextFieldFinder);
      await tester.enterText(topTextFieldFinder, '3');

      await tester.ensureVisible(bottomTextFieldFinder);
      await tester.tap(bottomTextFieldFinder);
      await tester.enterText(bottomTextFieldFinder, '6');

      //Transitioning from 'is ???' to 'is 9.0' represents a new frame
      //await tester.pump(); => only works with single frame | fails if there
      //are more frames in 1 sec
      await tester.pumpAndSettle();
      expect(find.text('is 9.0'), findsOneWidget);
    });
  });
}
