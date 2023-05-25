import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'FavoriteTopCard.dart';
import 'FavoriteStores.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:lottie/lottie.dart';

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

  Future<bool> update() async {
    refreshMarkets();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('favorites_page'),
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
                        child: RefreshIndicator(
                            onRefresh: () async => await update(),
                            color: Color.fromRGBO(188, 222, 228, 1),
                            child: (MarketDatabaseManager
                                        .currentFavoriteStores.length ==
                                    0)
                                ? Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    color: Color.fromRGBO(52, 93, 100, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 90,
                                          ),
                                          Container(
                                            height: 300,
                                            color:
                                                Color.fromRGBO(52, 93, 100, 0),
                                            child: Lottie.asset(
                                                'assets/animations/empty.json'),
                                          ),
                                          SizedBox(
                                            height: 70,
                                          ),
                                          Text(
                                            'Ainda nenhuma loja',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  153, 146, 146, 0.8),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'foi adicionada.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  146, 150, 153, 0.8),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : ListView.builder(
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
                                    })))
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
