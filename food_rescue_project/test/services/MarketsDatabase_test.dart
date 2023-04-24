import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mockito/mockito.dart';
import 'package:food_rescue/services/marketsdb.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  group('MarketDatabaseManager', () {
    late MarketDatabaseManager manager;
    late MockDatabase database;

    setUp(() {
      manager = MarketDatabaseManager.instance;
      database = MockDatabase();
    });

    test('can get database instance', () async {
      // Arrange
      final mockDatabase = database;

      // Act
      final actual = await manager.database;

      // Assert
      expect(actual, mockDatabase);
    });

    test('can create market', () async {
      // Arrange
      final mockDatabase = database;
      final market = Market(
        market_chain_name: 'chain name',
        market_name: 'name',
        market_latitude: 1.0,
        market_longitude: 1.0,
        is_favorite: 'sim',
        store_image: 'image',
      );
      final expected = market.copy(id: 1);

      // Act
      final actual = await MarketDatabaseManager.create(market);

      // Assert
      verify(mockDatabase.insert(tableMarkets, market.toJson()));
      expect(actual, expected);
    });
/*
    test('can read market', () async {
      // Arrange
      final mockDatabase = database;
      final market = Market(
        id: 1,
        market_chain_name: 'chain name',
        market_name: 'name',
        market_latitude: 1.0,
        market_longitude: 1.0,
        is_favorite: 'yes',
        store_image: 'image',
      );
      when(mockDatabase.query(
        any,
        columns: anyNamed('columns'),
        where: anyNamed('where'),
        whereArgs: anyNamed('whereArgs'),
      )).thenAnswer((_) async => [market.toJson()]);

      // Act
      final actual = await manager.readMarket(1);

      // Assert
      verify(await mockDatabase.isOpen);
      expect(actual, market);
    });*/
  });
}
