import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsCategories.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:food_rescue/screens/StoresPage/MapPage.dart';

void main() {
  group('MyMapPage', () {
    testWidgets('Widget creation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: MyMapPage()),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    test('get_current_store_names', () {
      final currentStore = [
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true
      ];
      final storeNames = get_current_store_names(currentStore);

      expect(storeNames, hasLength(11));
      expect(
          storeNames,
          containsAll([
            'Apolónia',
            'Brio',
            'Meu Super',
            'Minipreço',
            'Continente',
            'Supercor',
            'Jumbo',
            'Froiz',
            'Lidl',
            'Pingo Doce',
            'Intermaché'
          ]));
    });
  });
}
