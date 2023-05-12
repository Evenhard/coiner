import 'package:crypto_app/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:crypto_app/main.dart';

void main() {
  testWidgets('Pass splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final letMeInButton = find.byKey(const ValueKey('letMeInButton'));

    await tester.pumpWidget(const MaterialApp(home: SplashPage()));

    expect(find.text("COINER"), findsOneWidget);

    // await tester.tap(letMeInButton);
    // await tester.pump();

    // expect(find.text("COINER"), findsNothing);
  });
}
