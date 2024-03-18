import 'package:flutter_driver/driver_extension.dart';
import 'package:unit_testing_example_one/main.dart' as app;

void main() {
  /// we use this line to enables flutter driver VM service extension.
  enableFlutterDriverExtension();
  app.main();
}
