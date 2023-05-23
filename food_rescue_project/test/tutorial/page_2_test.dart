import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:food_rescue/tutorial/page_2.dart';

void main() {
  group('Page2 Widget', () {
    testWidgets('Page2 displays correct text', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page2()));

      final textFinder = find.text('Escolhe os produtos que mais te agradam');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('Page2 displays Lottie animation', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page2()));

      final lottieFinder = find.byType(Lottie);
      expect(lottieFinder, findsOneWidget);
    });

    testWidgets('Page2 has a colored container', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Page2()));

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
