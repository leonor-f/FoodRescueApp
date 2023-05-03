import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:food_rescue/screens/FavoritesPage/FavoriteStores.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:mockito/mockito.dart';

class MockMarketDatabaseManager extends Mock implements MarketDatabaseManager {}

void main() {
  group('FavoriteStores widget', () {
    final Market testMarket = Market(
        market_chain_name: 'Market Chain',
        market_name: 'Market',
        market_latitude: 10.00,
        market_longitude: 10.00,
        is_favorite: 'sim',
        store_image: 'assets/images/continente.png');

    testWidgets('FavoriteProducts widget displays correct information',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavoriteStores(
                storeName: testMarket.market_name,
                storeImage: testMarket.store_image,
                market: testMarket),
          ),
        ),
      );

      expect(find.text(testMarket.market_name), findsOneWidget);
      expect(find.text('Remover dos favoritos  '), findsOneWidget);
      expect(find.text(testMarket.market_name), findsOneWidget);
    });
  });
}
