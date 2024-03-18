import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_example_one/main.dart';

void main() {
  /// Widget Testing
  testWidgets("We will make widget Test for screen for all buttons ",
      (WidgetTester tester) async {
    /// The pumpWidget method builds and renders the provided widget.
    await tester.pumpWidget(const MyApp());

    /// we make search for text field by find method through type of widget.
    var textField = find.byType(TextFormField);

    ///expect if this widget it's only one widget through this matcher type (findsOneWidget).
    expect(textField, findsOneWidget);

    /// anther test we enter any text by enterText method.
    await tester.enterText(textField, "Flutter Dart 3");

    /// to ensure we write this text inside text form field.
    expect(find.text("Flutter Dart 3"), findsOneWidget);

    ///this line to access Reverse Button and then ensure we have this button.
    var button = find.text("Reverse");
    expect(button, findsOneWidget);

    /// we press the button and make pump to make refresh and rebuild to show result of Reverse Button
    await tester.tap(button);
    await tester.pump();

    /// to ensure that result is correct.
    expect(find.text("3 traD rettulF"), findsOneWidget);
  });
}
