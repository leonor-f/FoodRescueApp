import 'package:sqflite/sqflite.dart';
import '../models/products.dart';
import 'package:path/path.dart';
import '../services/productsdb.dart';

class ProductDatabaseManager {
  static String is_to_buy = 'sim';
  static List<List<dynamic>> currentFavoriteItems = [];
  static List<List<dynamic>> allItems = [];
  static List<List<dynamic>> allStoreItems = [];

  static final ProductDatabaseManager instance = ProductDatabaseManager._init();

  static Database? _database;

  ProductDatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('productsDatabb.db');
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
    CREATE TABLE $tableProducts ( 
      ${ProductsFields.id} $idType, 
      ${ProductsFields.market_name} $textType,
      ${ProductsFields.product_description} $textType,
      ${ProductsFields.old_price} $doubleType,
      ${ProductsFields.new_price} $doubleType,
      ${ProductsFields.quantity} $doubleType,
      ${ProductsFields.expiration_date} $textType,
      ${ProductsFields.to_buy} $textType,
      ${ProductsFields.category} $textType,
      ${ProductsFields.product_image} $textType,
      ${ProductsFields.store_image} $textType
    )
    ''');

    await populateDatabase(db);
  }

  Future<Product> create(Product product) async {
    final db = await instance.database;
    final id = await db.insert(tableProducts, product.toJson());
    return product.copy(id: id);
  }

  Future<Product> readProduct(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableProducts,
      columns: ProductsFields.values,
      where: '${ProductsFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Product.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Product>> readAllProducts() async {
    final db = await instance.database;
    final result = await db.query(tableProducts);
    allItems.clear();

    List<Product> products =
        result.map((json) => Product.fromJson(json)).toList();

    // Clear the list before adding new stores
    currentFavoriteItems.clear();

    for (int i = 0; i < products.length; i++) {
      final String product_description = products[i].product_description;
      final String to_buy = products[i].to_buy;
      final String category = products[i].category;
      final String product_image = products[i].product_image;
      final String market_name = products[i].market_name;
      final String expiration_date = products[i].expiration_date;
      final double old_price = products[i].old_price;
      final double new_price = products[i].new_price;
      final double quantity = products[i].quantity;
      final String store_image = products[i].store_image;

      allItems.add([
        product_description,
        category,
        product_image,
        old_price,
        new_price,
        expiration_date,
        market_name,
        quantity,
        products[i],
        store_image,
      ]);

      if (is_to_buy == to_buy) {
        currentFavoriteItems.add([
          product_description,
          category,
          store_image,
          old_price,
          new_price,
          expiration_date,
          market_name,
          products[i],
          product_image,
        ]);
      }
    }

    return products;
  }

  static Future<int> update(Product product) async {
    final db = await instance.database;

    return db.update(
      tableProducts,
      product.toJson(),
      where: '${ProductsFields.id} = ?',
      whereArgs: [product.id],
    );
  }

  Future updateProductToBuy(Product product, String to_buy_) async {
    final product_ = product.copy(
        market_name: product.market_name,
        product_description: product.product_description,
        old_price: product.old_price,
        new_price: product.new_price,
        quantity: product.quantity,
        expiration_date: product.expiration_date,
        to_buy: to_buy_,
        category: product.category,
        product_image: product.product_image,
        store_image: product.store_image);

    await update(product_);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableProducts,
      where: '${ProductsFields.id} = ?',
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

    for (final product in ProductsDatabase.initialProducts) {
      await db.insert(tableProducts, product.toJson());
    }
  }

  static Future<int> readAllStoreProducts(String store) async {
    final db = await instance.database;
    final result = await db.query(tableProducts);
    allStoreItems.clear();

    List<Product> products =
        result.map((json) => Product.fromJson(json)).toList();

    for (int i = 0; i < products.length; i++) {
      final String product_description = products[i].product_description;
      final String to_buy = products[i].to_buy;
      final String category = products[i].category;
      final String product_image = products[i].product_image;
      final String market_name = products[i].market_name;
      final String expiration_date = products[i].expiration_date;
      final double old_price = products[i].old_price;
      final double new_price = products[i].new_price;
      final double quantity = products[i].quantity;
      final String store_image = products[i].store_image;

      if (market_name == store) {
        allStoreItems.add([
          product_description,
          category,
          product_image,
          old_price,
          new_price,
          expiration_date,
          market_name,
          quantity,
          products[i],
          store_image,
        ]);
      }
    }
    return 0;
  }
}
