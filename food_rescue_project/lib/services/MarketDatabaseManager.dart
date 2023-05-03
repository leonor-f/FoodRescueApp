import 'package:sqflite/sqflite.dart';
import '../models/markets.dart';
import 'package:path/path.dart';
import '../services/marketsdb.dart';

class MarketDatabaseManager {
  static String favourite = 'sim';
  static List<List<dynamic>> currentFavoriteStores = [];
  static List<List<dynamic>> allStores = [];

  static final MarketDatabaseManager instance = MarketDatabaseManager._init();

  static Database? _database;

  MarketDatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('marketsdb.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final doubleType = 'DOUBLE NOT NULL';

    await db.execute('''
    CREATE TABLE $tableMarkets ( 
      ${MarketsFields.id} $idType, 
      ${MarketsFields.market_chain_name} $textType,
      ${MarketsFields.market_name} $textType,
      ${MarketsFields.market_latitude} $doubleType,
      ${MarketsFields.market_longitude} $doubleType,
      ${MarketsFields.is_favorite} $textType,
      ${MarketsFields.store_image} $textType,
      ${MarketsFields.store_pin} $textType
    )
    ''');

    await populateDatabase(db);
  }

  static Future<Market> create(Market market) async {
    final db = await instance.database;
    final id = await db.insert(tableMarkets, market.toJson());
    return market.copy(id: id);
  }

  Future<Market> readMarket(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableMarkets,
      columns: MarketsFields.values,
      where: '${MarketsFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Market.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Market>> readAllMarkets() async {
    final db = await instance.database;
    final result = await db.query(tableMarkets);

    List<Market> markets = result.map((json) => Market.fromJson(json)).toList();

    // Clear the list before adding new stores
    currentFavoriteStores.clear();

    for (int i = 0; i < markets.length; i++) {
      final String storeName = markets[i].market_name;
      final String isFavorite = markets[i].is_favorite;
      final String storeImage = markets[i].store_image;
      final String marketChainName = markets[i].market_chain_name;
      final double marketLatitude = markets[i].market_latitude;
      final double marketLongitude = markets[i].market_longitude;
      final String markerPin = markets[i].store_pin;

      allStores.add([storeName, markerPin, marketLatitude, marketLongitude]);

      if (favourite == isFavorite) {
        currentFavoriteStores.add([storeName, storeImage, markets[i]]);
      }
    }

    return markets;
  }

  Future<int> update(Market market) async {
    final db = await instance.database;

    return db.update(
      tableMarkets,
      market.toJson(),
      where: '${MarketsFields.id} = ?',
      whereArgs: [market.id],
    );
  }

  Future updateFavoriteMarket(Market market) async {
    final market_ = market.copy(
        market_chain_name: market.market_chain_name,
        market_name: market.market_name,
        market_latitude: market.market_latitude,
        market_longitude: market.market_longitude,
        is_favorite: 'não',
        store_image: market.store_image);

    await update(market_);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableMarkets,
      where: '${MarketsFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    _database = null;

    db.close();
  }

  Future<void> populateDatabase(_database) async {
    final db = await _database;

    for (final market in MarketsDatabase.initialMarkets) {
      await db.insert(tableMarkets, market.toJson());
    }
  }
}
