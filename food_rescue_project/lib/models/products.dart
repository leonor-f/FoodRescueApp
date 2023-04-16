final String tableProducts = 'products';

class ProductsFields {
  static final List<String> values = [
    id,
    market_name,
    product_description,
    old_price,
    new_price,
    quantity,
    expiration_date,
    to_buy,
    category,
    product_image
  ];

  static final String id = '_id';
  static final String market_name = 'market_name';
  static final String product_description = 'product_description';
  static final String old_price = 'old_price';
  static final String new_price = 'new_price';
  static final String quantity = 'quantity';
  static final String expiration_date = 'expiration_date';
  static final String to_buy = 'to_buy';
  static final String category = 'category';
  static final String product_image = 'product_image';
}

class Product {
  final int? id;
  final String market_name;
  final String product_description;
  final double old_price;
  final double new_price;
  final double quantity;
  final String expiration_date;
  final String to_buy;
  final String category;
  final String product_image;

  const Product(
      {this.id,
      required this.market_name,
      required this.product_description,
      required this.old_price,
      required this.new_price,
      required this.quantity,
      required this.expiration_date,
      required this.to_buy,
      required this.category,
      required this.product_image});

  Product copy({
    int? id,
    String? market_name,
    String? product_description,
    double? old_price,
    double? new_price,
    double? quantity,
    String? expiration_date,
    String? to_buy,
    String? category,
    String? product_image,
  }) =>
      Product(
        id: id ?? this.id,
        market_name: market_name ?? this.market_name,
        product_description: product_description ?? this.product_description,
        old_price: old_price ?? this.old_price,
        new_price: new_price ?? this.new_price,
        quantity: quantity ?? this.quantity,
        expiration_date: expiration_date ?? this.expiration_date,
        to_buy: to_buy ?? this.to_buy,
        category: category ?? this.category,
        product_image: product_image ?? this.product_image,
      );

  static Product fromJson(Map<String, Object?> json) => Product(
        id: json[ProductsFields.id] as int?,
        market_name: json[ProductsFields.market_name] as String,
        product_description: json[ProductsFields.product_description] as String,
        old_price: json[ProductsFields.old_price] as double,
        new_price: json[ProductsFields.new_price] as double,
        quantity: json[ProductsFields.quantity] as double,
        expiration_date: json[ProductsFields.expiration_date] as String,
        to_buy: json[ProductsFields.to_buy] as String,
        category: json[ProductsFields.category] as String,
        product_image: json[ProductsFields.product_image] as String,
      );

  Map<String, Object?> toJson() => {
        ProductsFields.id: id,
        ProductsFields.market_name: market_name,
        ProductsFields.product_description: product_description,
        ProductsFields.old_price: old_price,
        ProductsFields.new_price: new_price,
        ProductsFields.quantity: quantity,
        ProductsFields.expiration_date: expiration_date,
        ProductsFields.to_buy: to_buy,
        ProductsFields.category: category,
        ProductsFields.product_image: product_image
      };
}
