import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  late Calculator calculator;

  setUpAll(() {
    //Runs before any test is executed
  });

  setUp(() {
    //Runs before every test is executed
    calculator = Calculator();
  });

  tearDown(() {
    //Runs after every test is executed
  });

  tearDownAll(() {
    //Runs after all tests have been executed
  });

  test('Calculator creates a non null object', () {
    expect(Calculator(), isNotNull);
  });

  //grouping similar tests
  group('add', () {
    test('the calculator returns a double number when adding 2 and 2', () {
      expect(calculator.add(2, 2), isA<double>());
    });

    test('the calculator returns 4 when adding 2 and 2', () {
      expect(calculator.add(2, 2), 4, reason: 'It should be exactly 4');
    });
  });

  group('subtract', () {
    test('the calculator returns 4 when 2 is subtracted from 6', () {
      expect(calculator.subtract(6, 2), 4, reason: 'It should be exactly 4');
    });
  });

  group('multiply', () {
    test('the calculator returns a 9 when 3 is multiplied by 3', () {
      expect(calculator.multiply(3, 3), 9);
    });

    test('the calculator returns a 27 when 9 is multiplied by 3', () {
      expect(calculator.multiply(9, 3), 27);
    });
  });

  group('divide', () {
    test('the calculator returns a 1 when 2 is divided by 2', () {
      expect(calculator.divide(2, 2), 1);
    });

    test('the calculator throws an ArgumentError when divide by 0', () {
      expect(() => calculator.divide(2, 0), throwsArgumentError);
    });
  });

  group('testing future - powerOfTwo', () {
    test('returns 81 when the input is 9', () async {
      expect(await calculator.powerOfTwo(9), 81);
    });
  });

  group('testing streams - pi', () {
    test('emits [3, 3.1, 3.14, 3.141, 3.1415] in that order', () async {
      expect(calculator.pi(), emitsInOrder([3, 3.1, 3.14, 3.141, 3.1415]));
    });
  });
}
