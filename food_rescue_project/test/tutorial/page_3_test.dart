import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:food_rescue/tutorial/page_3.dart';

void main() {
  group('Page3 Widget', () {
    testWidgets('Page3 displays correct text', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page3()));

      final textFinder =
          find.text('Guarda as tuas lojas e produtos favoritos!');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('Page3 displays Lottie animation', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page3()));

      final lottieFinder = find.byType(Lottie);
      expect(lottieFinder, findsOneWidget);
    });

    testWidgets('Page3 has a colored container', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page3()));

      final containerFinder = find.byWidgetPredicate((widget) {
        if (widget is Container &&
            widget.color == Color.fromRGBO(52, 93, 100, 1)) {
          return true;
        }
        return false;
      });

      expect(containerFinder, findsOneWidget);
    });
  });
}
