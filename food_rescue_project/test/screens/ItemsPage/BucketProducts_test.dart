import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/products.dart';
import 'package:food_rescue/screens/ItemsPage/BucketProducts.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/models/products.dart';

void main() {
  final Product testProduct = Product(
    market_name: 'Test Market',
    product_description: 'Test Product',
    old_price: 10.0,
    new_price: 5.0,
    quantity: 1,
    expiration_date: '2023-04-30',
    to_buy: 'sim',
    category: 'Test Category',
    product_image: 'assets/images/continente.png',
  );

  IconData trash = IconData(0xf4c4,
      fontFamily: "CupertinoIcons", fontPackage: "cupertino_icons");

  testWidgets('FavoriteProducts widget displays correct information',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FavoriteProducts(
            productDescription: testProduct.product_description,
            productCategory: testProduct.category,
            productImage: testProduct.product_image,
            oldPrice: testProduct.old_price,
            newPrice: testProduct.new_price,
            expirationDate: testProduct.expiration_date,
            marketName: testProduct.market_name,
            product: testProduct,
          ),
        ),
      ),
    );

    expect(find.text(testProduct.product_description), findsOneWidget);
    expect(
        find.text('Preço antigo: ${testProduct.old_price}€'), findsOneWidget);
    expect(find.text('Preço novo: ${testProduct.new_price}€'), findsOneWidget);
    expect(find.text('Data de validade: ${testProduct.expiration_date}'),
        findsOneWidget);
    expect(find.text(testProduct.market_name), findsOneWidget);
  });
}
