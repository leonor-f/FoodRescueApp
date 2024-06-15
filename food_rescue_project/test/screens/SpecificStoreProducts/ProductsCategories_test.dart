import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsCategories.dart';

void main() {
  group('ProductPage', () {
    testWidgets('Renders all category buttons', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProductPage()));

      expect(find.text('Mercearia'), findsOneWidget);
      expect(find.text('Bio e Escolhas Alimentares'), findsOneWidget);
      expect(find.text('Congelados'), findsOneWidget);
      expect(find.text('Laticínios e Ovos'), findsOneWidget);
      expect(find.text('Peixe e Talho'), findsOneWidget);
      expect(find.text('Refeições Fáceis'), findsOneWidget);
      expect(find.text('Frutas e Legumes'), findsOneWidget);
      expect(find.text('Bebidas'), findsOneWidget);
      expect(find.text('Charcutaria e Queijos'), findsOneWidget);
      expect(find.text('Padaria e Pastelaria'), findsOneWidget);
    });
  });
}
