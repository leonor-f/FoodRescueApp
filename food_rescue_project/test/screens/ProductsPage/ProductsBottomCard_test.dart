import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/screens/ProductsPage/ProductsBottomCard.dart';

void main() {
  testWidgets('BottomPanel - Initial state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottomPanel(controller: ScrollController()),
        ),
      ),
    );

    // Check the initial state of the order options
    expect(preco_crescente, true);
    expect(preco_decrescente, false);
    expect(validade_crescente, false);
    expect(validade_decrescente, false);

    // Verify that the text widgets are displayed
    expect(find.text('Ordenar por:'), findsOneWidget);
    expect(find.text('Preço crescente'), findsOneWidget);
    expect(find.text('Preço decrescente'), findsOneWidget);
    expect(find.text('Data de validade crescente'), findsOneWidget);
    expect(find.text('Data de validade decrescente'), findsOneWidget);
  });

  testWidgets('BottomPanel - Order options tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottomPanel(controller: ScrollController()),
        ),
      ),
    );

    // Tap the order options
    await tester.tap(find.text('Preço decrescente'));
    await tester.pump();

    // Check the updated state after tapping
    expect(preco_crescente, false);
    expect(preco_decrescente, true);
    expect(validade_crescente, false);
    expect(validade_decrescente, false);
    expect(BottomPanel.order_by, 1);

    // Tap another order option
    await tester.tap(find.text('Data de validade crescente'));
    await tester.pump();

    // Check the updated state after tapping
    expect(preco_crescente, false);
    expect(preco_decrescente, false);
    expect(validade_crescente, true);
    expect(validade_decrescente, false);
    expect(BottomPanel.order_by, 2);
  });
}
