import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_rescue/Sheets/StoresProduct.dart';
import 'BucketTopCard.dart';
import 'BucketProducts.dart';

class BucketPage extends StatefulWidget {
  const BucketPage({Key? key}) : super(key: key);

  @override
  _BucketPageState createState() => _BucketPageState();
}

class _BucketPageState extends State<BucketPage> {
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
                                GoogleSheetsApi.currentFavoriteProducts.length,
                            itemBuilder: (context, index) {
                              return FavoriteProducts(
                                productName: GoogleSheetsApi
                                    .currentFavoriteProducts[index][0],
                                productPrice: GoogleSheetsApi
                                    .currentFavoriteProducts[index][1],
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
