import 'package:calculator_app_testing/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Pi', () {
    testWidgets(
      'the values of pi are 3.1, 3.14, 3.141 and 3.1415',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        expect(find.text('Calculating pi...'), findsOneWidget);
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(
          find.text('The latest known value of pi is 3.1'),
          findsOneWidget,
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(
          find.text('The latest known value of pi is 3.14'),
          findsOneWidget,
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(
          find.text('The latest known value of pi is 3.141'),
          findsOneWidget,
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(
          find.text('The latest known value of pi is 3.1415'),
          findsOneWidget,
        );
      },
    );
  });

  group('Multiply', () {
    testWidgets(
      'multiply 5 and 10 shows 50',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        final topTextFieldFinder =
            find.byKey(const Key('textField_top_multiplied_by'));
        final bottomTextFieldFinder =
            find.byKey(const Key('textField_bottom_multiplied_by'));

        //ensure that widget is visible in scrollable view
        await tester.ensureVisible(topTextFieldFinder);
        await tester.tap(topTextFieldFinder);
        await tester.enterText(topTextFieldFinder, '5');

        await tester.ensureVisible(bottomTextFieldFinder);
        await tester.tap(bottomTextFieldFinder);
        await tester.enterText(bottomTextFieldFinder, '10');

        await tester.pumpAndSettle();
        expect(find.text('is 50.0'), findsOneWidget);
      },
    );
  });
}
