class Calculator {
  double? add(double a, double b) => a + b;

  double? subtract(double a, double b) => a - b;

  double? multiply(double a, double b) => a * b;

  double? divide(double a, double b) {
    if (b == 0) throw ArgumentError('You cannot divide by zero');
    return a / b;
  }

  Future<double>? powerOfTwo(double a) {
    return Future.delayed(const Duration(seconds: 1), () => a * a);
  }

  final List<double> _piValues = [3, 3.1, 3.14, 3.141, 3.1415];

  //Stream<double>? pi() => Stream.fromIterable(_piValues);

  Stream<double>? pi() =>
      Stream.periodic(const Duration(seconds: 1), (count) => _piValues[count]);
}
