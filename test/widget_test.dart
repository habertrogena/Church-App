// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rentals_app/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  testWidgets('Counter', (WidgetTester tester) async {
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('welcome!'), findsNothing);
    expect(find.text('1'), findsNothing);
  });
}
