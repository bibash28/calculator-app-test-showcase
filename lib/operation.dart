enum Operation {
  add,
  subtract,
  multiply,
  divide,
}

extension OperationX on Operation {
  String get description {
    switch (this) {
      case Operation.add:
        return 'plus';
      case Operation.subtract:
        return 'minus';
      case Operation.multiply:
        return 'multiplied by';
      case Operation.divide:
        return 'divided by';
    }
  }
}
