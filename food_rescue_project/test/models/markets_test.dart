import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/markets.dart';

void main() {
  group('Market model tests', () {
    test('Market model can be instantiated', () {
      const market = Market(
        market_chain_name: 'Test Market Chain',
        market_name: 'Test Market',
        market_latitude: 37.7749,
        market_longitude: -122.4194,
        is_favorite: 'não',
        store_image: 'https://example.com/test-image.jpg',
      );

      expect(market.market_chain_name, 'Test Market Chain');
      expect(market.market_name, 'Test Market');
      expect(market.market_latitude, 37.7749);
      expect(market.market_longitude, -122.4194);
      expect(market.is_favorite, 'não');
      expect(market.store_image, 'https://example.com/test-image.jpg');
    });

    test('Market model copy method works as expected', () {
      const market = Market(
        id: 1,
        market_chain_name: 'Test Market Chain',
        market_name: 'Test Market',
        market_latitude: 37.7749,
        market_longitude: -122.4194,
        is_favorite: 'não',
        store_image: 'https://example.com/test-image.jpg',
      );

      final updatedMarket = market.copy(
        market_name: 'New Test Market',
        market_latitude: 37.7793,
        is_favorite: 'sim',
      );

      expect(updatedMarket.id, 1);
      expect(updatedMarket.market_chain_name, 'Test Market Chain');
      expect(updatedMarket.market_name, 'New Test Market');
      expect(updatedMarket.market_latitude, 37.7793);
      expect(updatedMarket.market_longitude, -122.4194);
      expect(updatedMarket.is_favorite, 'sim');
      expect(updatedMarket.store_image, 'https://example.com/test-image.jpg');
    });
  });

  final tMarket = Market(
    id: 1,
    market_chain_name: 'Test Market Chain',
    market_name: 'Test Market',
    market_latitude: 12.345,
    market_longitude: 67.890,
    is_favorite: 'sim',
    store_image: 'test_image.jpg',
  );

  test('fromJson method works as expected', () {
    final Map<String, dynamic> jsonMap = {
      '_id': 1,
      'market_chain_name': 'Test Market Chain',
      'market_name': 'Test Market',
      'market_latitude': 12.345,
      'market_longitude': 67.890,
      'is_favorite': 'sim',
      'store_image': 'test_image.jpg',
    };

    final result = Market.fromJson(jsonMap);

    expect(result.id, tMarket.id);
    expect(result.market_chain_name, tMarket.market_chain_name);
    expect(result.market_name, tMarket.market_name);
    expect(result.market_latitude, tMarket.market_latitude);
    expect(result.market_longitude, tMarket.market_longitude);
    expect(result.is_favorite, tMarket.is_favorite);
    expect(result.store_image, tMarket.store_image);
  });

  test('toJson method works as expected', () {
    final result = tMarket.toJson();

    final Map<String, dynamic> expectedJsonMap = {
      '_id': 1,
      'market_chain_name': 'Test Market Chain',
      'market_name': 'Test Market',
      'market_latitude': 12.345,
      'market_longitude': 67.890,
      'is_favorite': 'sim',
      'store_image': 'test_image.jpg',
    };

    expect(result, expectedJsonMap);
  });
}
