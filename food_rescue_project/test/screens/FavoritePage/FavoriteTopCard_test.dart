import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_rescue/screens/FavoritesPage/FavoriteTopCard.dart';

void main() {
  group('TopCard widget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TopCard(),
          ),
        ),
      );

      final textFinder = find.text('As suas lojas favoritas');
      final containerFinder = find.byType(Container);

      expect(textFinder, findsOneWidget);
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('has correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: SizedBox(
        height: 1000,
        width: 1000,
        child: Center(child: TopCard()),
      )));

      final containerFinder = find.byType(Container);

      expect(containerFinder, findsOneWidget);
      expect(tester.getSize(containerFinder).height, 50);
      expect(tester.getSize(containerFinder).width, 380);
    });

    testWidgets('has correct decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TopCard(),
          ),
        ),
      );

      final containerFinder = find.byType(Container);

      expect(containerFinder, findsOneWidget);

      final container = tester.widget<Container>(containerFinder);

      expect(
          container.decoration,
          BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color.fromRGBO(188, 222, 228, 0.5),
          ));
    });
  });
}
