import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_example_one/main.dart';

void main() {
  test("We test the validate Email Function", () {
    String initial = "ali@yahoo.com";

    /// call the function validateEmailString to test it.
    String reserved = validateEmailString(initial);
    expect(reserved, "true");
  });
}
