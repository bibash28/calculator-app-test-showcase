import 'package:calculator_app_testing/main.dart' as calculator_app;
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  //called to let flutter know that we are running an instrumented app
  calculator_app.main();
  //called so that starting point of our application is known
}
