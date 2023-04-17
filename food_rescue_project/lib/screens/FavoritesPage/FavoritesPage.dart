import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'FavoriteTopCard.dart';
import 'FavoriteStores.dart';
import 'package:food_rescue/models/markets.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<Market> markets = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMarkets();
  }

  @override
  void dispose() {
    MarketDatabaseManager.instance.close();

    super.dispose();
  }

  Future refreshMarkets() async {
    setState(() => isLoading = true);
    this.markets = await MarketDatabaseManager.instance.readAllMarkets();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopCard(),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: MarketDatabaseManager
                                .currentFavoriteStores.length,
                            itemBuilder: (context, index) {
                              return FavoriteStores(
                                storeName: MarketDatabaseManager
                                    .currentFavoriteStores[index][0],
                                storeImage: MarketDatabaseManager
                                    .currentFavoriteStores[index][1],
                                market: MarketDatabaseManager
                                    .currentFavoriteStores[index][2],
                              );
                            }))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
