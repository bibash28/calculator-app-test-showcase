import 'package:calculator_app_testing/main.dart';
import 'package:calculator_app_testing/two_digit_operation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator App', () {
    testWidgets('renders four widgets of type TwoDigitalOperation',
        (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });
}
