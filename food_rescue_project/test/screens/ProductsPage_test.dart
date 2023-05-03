import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_rescue/screens/ProductsPage.dart';

void main() {
  group('ProductsPage', () {
    testWidgets('renders the title', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ProductsPage()));

      expect(find.text('Página com os produtos'), findsOneWidget);
    });

    testWidgets('has correct background color', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ProductsPage()));

      final containerFinder = find.byType(Container);

      expect(containerFinder, findsOneWidget);
      expect(
        (tester.widget(containerFinder) as Container).decoration,
        BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(188, 222, 228, 0.5),
        ),
      );
    });
  });
}
