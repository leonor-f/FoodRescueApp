import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:food_rescue/screens/FavoritesPage/FavoriteStores.dart';
import 'package:food_rescue/screens/FavoritesPage/FavoritesPage.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';

void main() {
  group('Market model', () {
    test('should have correct properties', () {
      final market = Market(
        market_chain_name: 'Test Chain',
        market_name: 'Test Market',
        market_latitude: 1.2345,
        market_longitude: -1.2345,
        is_favorite: 'sim',
        store_image: 'test.jpg',
        store_pin: 'test.jpg',
      );
      expect(market.market_chain_name, 'Test Chain');
      expect(market.market_name, 'Test Market');
      expect(market.market_latitude, 1.2345);
      expect(market.market_longitude, -1.2345);
      expect(market.is_favorite, 'sim');
      expect(market.store_image, 'test.jpg');
      expect(market.store_pin, 'test.jpg');
    });

    test('should convert to and from JSON', () {
      final json = {
        MarketsFields.id: 1,
        MarketsFields.market_chain_name: 'Test Chain',
        MarketsFields.market_name: 'Test Market',
        MarketsFields.market_latitude: 1.2345,
        MarketsFields.market_longitude: -1.2345,
        MarketsFields.is_favorite: 'sim',
        MarketsFields.store_image: 'test.jpg',
        MarketsFields.store_pin: 'test.jpg',
      };
      final market = Market.fromJson(json);
      expect(market.id, 1);
      expect(market.market_chain_name, 'Test Chain');
      expect(market.market_name, 'Test Market');
      expect(market.market_latitude, 1.2345);
      expect(market.market_longitude, -1.2345);
      expect(market.is_favorite, 'sim');
      expect(market.store_image, 'test.jpg');
      expect(market.store_pin, 'test.jpg');
      expect(market.toJson(), json);
    });
  });
}
