import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:food_rescue/tutorial/page_1.dart';

void main() {
  group('Page1 Widget', () {
    testWidgets('Page1 displays correct text', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page1()));

      final textFinder = find.text('Procura uma loja e seleciona-a no mapa');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('Page1 displays Lottie animation', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page1()));

      final lottieFinder = find.byType(Lottie);
      expect(lottieFinder, findsOneWidget);
    });

    testWidgets('Page1 has a colored container', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page1()));

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
