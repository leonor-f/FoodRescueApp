import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/products.dart';

void main() {
  group('Product model', () {
    test('should have correct properties', () {
      final product = Product(
        market_name: 'Test Market',
        product_description: 'Test product',
        old_price: 1.99,
        new_price: 0.99,
        quantity: 1.5,
        expiration_date: '2023-12-31',
        to_buy: 'sim',
        category: 'Test category',
        product_image: 'test.jpg',
        store_image: 'test.jpg',
      );
      expect(product.market_name, 'Test Market');
      expect(product.product_description, 'Test product');
      expect(product.old_price, 1.99);
      expect(product.new_price, 0.99);
      expect(product.quantity, 1.5);
      expect(product.expiration_date, '2023-12-31');
      expect(product.to_buy, 'sim');
      expect(product.category, 'Test category');
      expect(product.product_image, 'test.jpg');
      expect(product.store_image, 'test.jpg');
    });

    test('should convert to and from JSON', () {
      final json = {
        ProductsFields.id: 1,
        ProductsFields.market_name: 'Test Market',
        ProductsFields.product_description: 'Test product',
        ProductsFields.old_price: 1.99,
        ProductsFields.new_price: 0.99,
        ProductsFields.quantity: 1.5,
        ProductsFields.expiration_date: '2023-12-31',
        ProductsFields.to_buy: 'sim',
        ProductsFields.category: 'Test category',
        ProductsFields.product_image: 'test.jpg',
        ProductsFields.store_image: 'test.jpg',
      };
      final product = Product.fromJson(json);
      expect(product.id, 1);
      expect(product.market_name, 'Test Market');
      expect(product.product_description, 'Test product');
      expect(product.old_price, 1.99);
      expect(product.new_price, 0.99);
      expect(product.quantity, 1.5);
      expect(product.expiration_date, '2023-12-31');
      expect(product.to_buy, 'sim');
      expect(product.category, 'Test category');
      expect(product.product_image, 'test.jpg');
      expect(product.store_image, 'test.jpg');
      expect(product.toJson(), json);
    });
  });
}
