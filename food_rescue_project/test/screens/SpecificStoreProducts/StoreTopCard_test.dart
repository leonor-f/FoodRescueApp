import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/StoreTopCard.dart';
import 'package:food_rescue/home.dart';

void main() {
  testWidgets('TopCard renders correctly', (WidgetTester tester) async {
    // Create a mock Market instance
    Market market = Market(
      market_chain_name: 'Test Chain',
      market_name: 'Test Market',
      market_latitude: 1.2345,
      market_longitude: -1.2345,
      is_favorite: 'não',
      store_image: 'test.jpg',
      store_pin: 'test.jpg',
    );

    // Build TopCard widget wrapped in MaterialApp
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TopCard(
          market: market,
          is_fav: market.is_favorite,
        ),
      ),
    ));

    // Verify that the market name is displayed
    expect(find.text('Test Market'), findsOneWidget);

    // Tap the favorite button
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Verify that the favorite button updates its color
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(
      (tester.widget(find.byIcon(Icons.favorite)) as Icon).color,
      equals(Colors.white),
    );
  });
}
