import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/screens/ItemsPage/ItemsTopCard.dart';

void main() {
  testWidgets('TopCard displays the correct text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TopCard()));

    final textFinder = find.text('Produtos que planeia comprar');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('TopCard has a specific height and width',
      (WidgetTester tester) async {
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

  testWidgets('TopCard has a specific border radius and color',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TopCard()));

    final containerFinder = find.byType(Container);

    expect(containerFinder, findsOneWidget);
    expect(
        (tester.widget(containerFinder) as Container).decoration,
        BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(188, 222, 228, 0.5),
        ));
  });
}
