import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_example_one/main.dart';

void main() {
  group('all test cases about Reverse Function', () {
    test("We test the Reverse Function", () {
      String initial = "Welcome To Apply Test";

      /// call the function reverseString to test it.
      String reserved = reverseString(initial);
      expect(reserved, "tseT ylppA oT emocleW");
    });

    test("We test the Reverse Function", () {
      String initial = "Reverse Function";

      /// call the function reverseString to test it.
      String reserved = reverseString(initial);
      expect(reserved, "noitcnuF esreveR");
    });
  });
}

/// this command below if you want to run this file via terminal but be sure you are inside path of project
///flutter test test/reverse_string_unit_test.dart  run file
