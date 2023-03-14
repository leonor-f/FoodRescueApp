import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodrescue/Sheets/StoresProduct.dart';
import 'TopCard.dart';
import 'FavoriteStores.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool timerHasStarted = false;
  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        setStateIfMounted(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (GoogleSheetsApi.loading == true && timerHasStarted == false) {
      startLoading();
    }
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
                            itemCount:
                                GoogleSheetsApi.currentFavoriteStores.length,
                            itemBuilder: (context, index) {
                              return FavoriteStores(
                                storeName: GoogleSheetsApi
                                    .currentFavoriteStores[index][0],
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
