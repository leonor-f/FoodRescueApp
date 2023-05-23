import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/home.dart';
import 'package:food_rescue/screens/FavoritesPage/FavoritesPage.dart';
import 'package:food_rescue/screens/ItemsPage/BucketPage.dart';
import 'package:food_rescue/screens/ProductsPage/ProductsPage.dart';
import 'package:food_rescue/screens/StoresPage/StoresPage.dart';

void main() {
  group('MyStatefulWidget Widget Tests', () {
    testWidgets('BottomNavigationBar changes selected index correctly',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MyStatefulWidget(selectedIndex: 1),
        ),
      );

      await tester.tap(find.byIcon(Icons.shopping_basket_outlined));
      await tester.pump();

      expect(find.byType(StorePage), findsNothing);
      expect(find.byType(ProductsPage), findsOneWidget);
      expect(find.byType(FavoritesPage), findsNothing);
      expect(find.byType(BucketPage), findsNothing);

      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      expect(find.byType(StorePage), findsNothing);
      expect(find.byType(ProductsPage), findsNothing);
      expect(find.byType(FavoritesPage), findsOneWidget);
      expect(find.byType(BucketPage), findsNothing);

      await tester.tap(find.byIcon(Icons.receipt_long_outlined));
      await tester.pump();

      expect(find.byType(StorePage), findsNothing);
      expect(find.byType(ProductsPage), findsNothing);
      expect(find.byType(FavoritesPage), findsNothing);
      expect(find.byType(BucketPage), findsOneWidget);
    });
  });
}
