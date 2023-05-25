import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/models/products.dart';
import 'package:food_rescue/screens/ItemsPage/ItemsProducts.dart';
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
    store_image: 'assets/images/continente.png',
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

  testWidgets(
    'Confirmation dialog appears when "Remover dos favoritos" button is pressed',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FavoriteProducts(
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
      );

      expect(find.byType(AlertDialog), findsNothing);

      await tester.tap(find.byIcon(trash));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Confirmação'), findsOneWidget);
      expect(
        find.text(
            'Tem a certeza que pretende remover este produto dos seus favoritos?'),
        findsOneWidget,
      );
    },
  );

  testWidgets('Confirmation dialog "Cancelar" button cancels dialog',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: FavoriteProducts(
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
    );

    await tester.tap(find.byIcon(trash));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);

    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets(
    'Confirmation dialog "Sim" button removes product from favorites',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FavoriteProducts(
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
      );

      await tester.tap(find.byIcon(trash));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text('Sim'));
      await tester.pumpAndSettle();

      // Assert that the product is removed from favorites
      expect(
        ProductDatabaseManager.currentFavoriteItems.contains(testProduct),
        isFalse,
      );
    },
  );
}
