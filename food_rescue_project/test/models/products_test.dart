import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/products.dart';

void main() {
  group('Product class tests', () {
    test('Product toJson method works as expected', () {
      final product = Product(
        market_name: 'Supermarket',
        product_description: 'Product Description',
        old_price: 5.99,
        new_price: 4.99,
        quantity: 1.0,
        expiration_date: '2023-04-17',
        to_buy: 'Yes',
        category: 'Groceries',
        product_image: 'product.jpg',
      );

      final json = product.toJson();

      expect(json[ProductsFields.market_name], 'Supermarket');
      expect(json[ProductsFields.product_description], 'Product Description');
      expect(json[ProductsFields.old_price], 5.99);
      expect(json[ProductsFields.new_price], 4.99);
      expect(json[ProductsFields.quantity], 1.0);
      expect(json[ProductsFields.expiration_date], '2023-04-17');
      expect(json[ProductsFields.to_buy], 'Yes');
      expect(json[ProductsFields.category], 'Groceries');
      expect(json[ProductsFields.product_image], 'product.jpg');
    });

    test('Product fromJson method works as expected', () {
      final json = {
        ProductsFields.id: 1,
        ProductsFields.market_name: 'Supermarket',
        ProductsFields.product_description: 'Product Description',
        ProductsFields.old_price: 5.99,
        ProductsFields.new_price: 4.99,
        ProductsFields.quantity: 1.0,
        ProductsFields.expiration_date: '2023-04-17',
        ProductsFields.to_buy: 'Yes',
        ProductsFields.category: 'Groceries',
        ProductsFields.product_image: 'product.jpg',
      };

      final product = Product.fromJson(json);

      expect(product.id, 1);
      expect(product.market_name, 'Supermarket');
      expect(product.product_description, 'Product Description');
      expect(product.old_price, 5.99);
      expect(product.new_price, 4.99);
      expect(product.quantity, 1.0);
      expect(product.expiration_date, '2023-04-17');
      expect(product.to_buy, 'Yes');
      expect(product.category, 'Groceries');
      expect(product.product_image, 'product.jpg');
    });

    test('Product copy method works as expected', () {
      final product = Product(
        market_name: 'Supermarket',
        product_description: 'Product Description',
        old_price: 5.99,
        new_price: 4.99,
        quantity: 1.0,
        expiration_date: '2023-04-17',
        to_buy: 'Yes',
        category: 'Groceries',
        product_image: 'product.jpg',
      );

      final copiedProduct = product.copy(
        market_name: 'New Supermarket',
        product_description: 'New Product Description',
      );

      expect(copiedProduct.id, product.id);
      expect(copiedProduct.market_name, 'New Supermarket');
      expect(copiedProduct.product_description, 'New Product Description');
      expect(copiedProduct.old_price, product.old_price);
      expect(copiedProduct.new_price, product.new_price);
      expect(copiedProduct.quantity, product.quantity);
      expect(copiedProduct.expiration_date, product.expiration_date);
      expect(copiedProduct.to_buy, product.to_buy);
      expect(copiedProduct.category, product.category);
      expect(copiedProduct.product_image, product.product_image);
    });
  });
}
