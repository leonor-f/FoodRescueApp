import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsBottomCard.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsCategories.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsPage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  testWidgets('ProductsPage builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProductsPagee(),
      ),
    );

    expect(find.byType(SlidingUpPanel), findsOneWidget);
    expect(find.byType(ProductPage), findsOneWidget);
    expect(find.byType(BottomPanel), findsOneWidget);
  });
}
