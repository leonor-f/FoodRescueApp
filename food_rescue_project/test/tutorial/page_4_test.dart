import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:food_rescue/tutorial/page_4.dart';

void main() {
  group('Page4 Widget', () {
    testWidgets('Page4 displays correct text', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page4()));

      final textFinder = find.text('Poupa dinheiro e ajuda o ambiente!');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('Page4 displays Lottie animation', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page4()));

      final lottieFinder = find.byType(Lottie);
      expect(lottieFinder, findsOneWidget);
    });

    testWidgets('Page4 has a colored container', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page4()));

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
