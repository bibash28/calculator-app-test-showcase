import 'package:calculator/calculator.dart';
import 'package:calculator_app_testing/models/models.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class OperationsTab extends StatefulWidget {
  const OperationsTab({
    Key? key,
    required this.calculator,
  }) : super(key: key);

  final Calculator calculator;

  @override
  _OperationsTabState createState() => _OperationsTabState();
}

class _OperationsTabState extends State<OperationsTab> {
  final _input1Controller = TextEditingController();
  final _input2Controller = TextEditingController();

  var _isSaveButtonEnabled = false;

  Operations? _selectedOperation;
  double? _result;

  @override
  void initState() {
    super.initState();
    _input1Controller.addListener(() => setState(_calculateResult));
    _input2Controller.addListener(() => setState(_calculateResult));
  }

  @override
  void dispose() {
    _input1Controller.dispose();
    _input2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input #1',
            ),
            controller: _input1Controller,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: MaterialSegmentedControl(
              children: const {
                0: Text('+'),
                1: Text('-'),
                2: Text('x'),
                3: Text('/'),
              },
              selectionIndex: _selectedOperation?.index,
              borderColor: Colors.grey,
              selectedColor: Colors.blue,
              unselectedColor: Colors.white,
              borderRadius: 32,
              onSegmentChosen: (int index) {
                setState(() {
                  _selectedOperation = Operations.values[index];
                  _calculateResult();
                });
              },
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input #2',
            ),
            controller: _input2Controller,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
          ),
          _ResultDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              _result != null ? '$_result' : '--',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.end,
            ),
          ),
          ButtonBar(
            children: [
              OutlinedButton(
                child: const Text('Clear'),
                onPressed: () {
                  setState(() {
                    _input1Controller.clear();
                    _input2Controller.clear();
                    _isSaveButtonEnabled = false;
                    _selectedOperation = null;
                  });
                },
              ),
              OutlinedButton(
                onPressed: _isSaveButtonEnabled ? () {} : null,
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _calculateResult() {
    final input1 = double.tryParse(_input1Controller.text);
    final input2 = double.tryParse(_input2Controller.text);
    if (input1 == null || input2 == null || _selectedOperation == null) {
      _result = null;
      _isSaveButtonEnabled = false;
    } else {
      _isSaveButtonEnabled = true;
      _result = _calculate(input1, input2, _selectedOperation!);
    }
  }

  double _calculate(double a, double b, Operations operation) {
    switch (operation) {
      case Operations.add:
        return widget.calculator.add(a, b);
      case Operations.subtract:
        return widget.calculator.subtract(a, b);
      case Operations.multiply:
        return widget.calculator.multiply(a, b);
      case Operations.divide:
        return widget.calculator.divide(a, b);
    }
  }
}

class _ResultDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              color: Colors.black54,
              thickness: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('Result'),
          ),
        ],
      ),
    );
  }
}
