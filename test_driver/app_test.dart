import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("", () {
    test("", () {});
    test("", () {});
    test("", () {});
    test("", () {});
  });

  test('we make test for Stream of values', () {
    var stream = Stream.fromIterable([1, 2, 3, 6]);

    stream.listen(expectAsync1((number) {
      /// test values if inclusive range between(1 - 10)  and determine the length of values by count
      expect(number, inInclusiveRange(1, 10));
    }, count: 4));
  });

  /// integration Test
  group("flutter reverse app test", () {
    FlutterDriver? driver;

    /// connect flutter driver to the app before executing the runs.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    /// disconnect flutter driver from the app after executing the runs.
    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    /// we access widgets to control them.
    var textField = find.byType("TextFormField");
    var reverseButton = find.text("Reverse");
    var validateButton = find.text("Validate Email");
    var upperButton = find.text("Upper case");
    var reverse = find.text("gnitseT noitargetnI");
    var result = find.text("true");
    var resultUpper = find.text("INTEGRATION TESTING");

    test("test reverse function ", () async {
      await driver!.tap(textField);

      /// we use Future delayed to show result in slow mode.
      await Future.delayed(const Duration(seconds: 1));
      await driver!.enterText("Integration Testing");
      await Future.delayed(const Duration(seconds: 1));

      await driver!.waitForAbsent(reverse);
      await driver!.tap(reverseButton);

      await Future.delayed(const Duration(seconds: 1));
      await driver!.waitFor(reverse);
      await Future.delayed(const Duration(seconds: 3));

      /// Waits until there are no more transient callbacks in the queue.
      await driver!.waitUntilNoTransientCallbacks();
    });

    test("test validate Email", () async {
      await driver!.tap(textField);
      await Future.delayed(const Duration(seconds: 1));
      await driver!.enterText("Integration@gmail.com");
      await Future.delayed(const Duration(seconds: 1));

      await driver!.waitForAbsent(result);
      await driver!.tap(validateButton);

      await Future.delayed(const Duration(seconds: 1));
      await driver!.waitFor(result);
      await Future.delayed(const Duration(seconds: 3));

      /// Waits until there are no more transient callbacks in the queue.
      await driver!.waitUntilNoTransientCallbacks();
    });

    test("test upper Function", () async {
      await driver!.tap(textField);
      await Future.delayed(const Duration(seconds: 1));
      await driver!.enterText("Integration Testing");
      await Future.delayed(const Duration(seconds: 1));

      await driver!.waitForAbsent(resultUpper);
      await driver!.tap(upperButton);

      await Future.delayed(const Duration(seconds: 1));
      await driver!.waitFor(resultUpper);
      await Future.delayed(const Duration(seconds: 3));

      /// Waits until there are no more transient callbacks in the queue.
      await driver!.waitUntilNoTransientCallbacks();
    });
  });
}

/// to run integration test use command below.
/// flutter drive --target=test_driver/app.dart
