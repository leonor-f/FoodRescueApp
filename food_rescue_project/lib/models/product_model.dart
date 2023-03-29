class Product {
  final String maket_name;
  final String product_name;
  final double old_price;
  final double new_price;
  final double quantity;
  final double expiration_date;
  final bool is_available;
  final bool to_buy;
  final String product_image;
  final String category;

  const Product ({
    required this.maket_name,
    required this.product_name,
    required this.old_price,
    required this.new_price,
    required this.quantity,
    required this.expiration_date,
    required this.is_available,
    required this.to_buy,
    required this.product_image,
    required this.category
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    maket_name: json['maket_name'],
    product_name: json['product_name'],
    old_price: json['old_price'],
    new_price: json['new_price'],
    quantity: json['quantity'],
    expiration_date: json['expiration_date'],
    is_available: json['is_available'],
    to_buy: json['to_buy'],
    product_image: json['product_image'],
    category: json['category']
  );

  Map<String, dynamic> toJson() => {
    'maket_name': maket_name,
    'product_name': product_name,
    'old_price': old_price,
    'new_price': new_price,
    'quantity': quantity,
    'expiration_date': expiration_date,
    'is_available': is_available,
    'to_buy': to_buy,
    'product_image': product_image,
    'category': category
  };
}