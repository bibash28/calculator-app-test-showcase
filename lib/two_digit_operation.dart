import 'package:calculator/calculator.dart';
import 'package:calculator_app_testing/operation.dart';
import 'package:flutter/material.dart';

class TwoDigitOperation extends StatefulWidget {
  const TwoDigitOperation({
    Key? key,
    required this.operation,
    required this.calculator,
  }) : super(key: key);

  final Operation operation;
  final Calculator calculator;

  @override
  _TwoDigitOperationState createState() => _TwoDigitOperationState();
}

class _TwoDigitOperationState extends State<TwoDigitOperation> {
  final TextEditingController _topTextController = TextEditingController();
  final TextEditingController _bottomTextController = TextEditingController();

  String? _operationResult;
  String? _resultAfterAnimation;

  @override
  void initState() {
    _topTextController.addListener(_getResult);
    _bottomTextController.addListener(_getResult);
    super.initState();
  }

  @override
  void dispose() {
    _topTextController.dispose();
    _bottomTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          key: Key('textField_top_${widget.operation.description}'),
          controller: _topTextController,
          keyboardType: TextInputType.number,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                widget.operation.description,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
              child: TextFormField(
                key: Key('textField_bottom_${widget.operation.description}'),
                controller: _bottomTextController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceIn,
          color: _operationResult == null ? Colors.transparent : Colors.lightGreen,
          onEnd: (){
            setState(() {
              _resultAfterAnimation = _operationResult;
            });
          },
          child: Text(
            'is ${_resultAfterAnimation ?? '???'}',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }

  void _getResult() {
    if (_topTextController.text.isNotEmpty &&
        _bottomTextController.text.isNotEmpty) {
      try {
        final result = _calculate(
          double.tryParse(_topTextController.text)!,
          double.tryParse(_bottomTextController.text)!,
        );
        setState(() {
          _operationResult = result.toString();
        });
      } catch (_) {
        setState(() {
          _operationResult = null;
        });
      }
    }
  }

  double _calculate(double top, double bottom) {
    double result;
    switch (widget.operation) {
      case Operation.add:
        result = widget.calculator.add(top, bottom);
        break;
      case Operation.subtract:
        result = widget.calculator.subtract(top, bottom);
        break;
      case Operation.multiply:
        result = widget.calculator.multiply(top, bottom);
        break;
      case Operation.divide:
        result = widget.calculator.divide(top, bottom);
        break;
    }
    return result;
  }
}
