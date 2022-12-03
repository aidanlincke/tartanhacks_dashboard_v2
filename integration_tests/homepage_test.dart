import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:thdapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end login test', () {
    testWidgets('enter login details',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          expect(find.text('Welcome to TartanHacks!'), findsOneWidget);
        });
  });
}