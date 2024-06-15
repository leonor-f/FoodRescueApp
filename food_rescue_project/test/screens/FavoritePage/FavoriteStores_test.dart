import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_rescue/home.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:food_rescue/screens/FavoritesPage/FavoriteStores.dart';

void main() {
  group('FavoriteStores Widget Tests', () {
    const storeName = 'Test Store';
    const storeImage = 'assets/images/continente.png';
    const market = Market(
      id: 1,
      market_chain_name: 'Market Chain',
      market_name: 'Market',
      market_latitude: 1.23,
      market_longitude: 4.56,
      is_favorite: 'yes',
      store_image: 'assets/images/continente.png',
      store_pin: 'assets/images/continente.png',
    );

    testWidgets(
        'Confirmation dialog appears when "Remover dos favoritos" button is pressed',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FavoriteStores(
            storeName: storeName,
            storeImage: storeImage,
            market: market,
          ),
        ),
      );

      expect(find.byType(AlertDialog), findsNothing);

      await tester.tap(find.text('Remover dos favoritos'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Confirmação'), findsOneWidget);
      expect(
          find.text(
              'Tem a certeza que pretende remover esta loja dos seus favoritos?'),
          findsOneWidget);
    });

    testWidgets('Confirmation dialog "Cancelar" button cancels dialog',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FavoriteStores(
            storeName: storeName,
            storeImage: storeImage,
            market: market,
          ),
        ),
      );

      await tester.tap(find.text('Remover dos favoritos'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text('Cancelar'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('Confirmation dialog "Sim" button removes store from favorites',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FavoriteStores(
            storeName: storeName,
            storeImage: storeImage,
            market: market,
          ),
        ),
      );

      await tester.tap(find.text('Remover dos favoritos'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text('Sim'));
      await tester.pumpAndSettle();

      // Assert that the store is removed from favorites
      expect(MarketDatabaseManager.currentFavoriteStores.contains(market),
          isFalse);
    });
  });
}
