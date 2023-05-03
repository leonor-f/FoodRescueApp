import 'dart:async';
import 'package:flutter/material.dart';
import 'BucketTopCard.dart';
import 'BucketProducts.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/models/products.dart';

class BucketPage extends StatefulWidget {
  const BucketPage({Key? key}) : super(key: key);

  @override
  _BucketPageState createState() => _BucketPageState();
}

class _BucketPageState extends State<BucketPage> {
  late List<Product> markets = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProducts();
  }

  @override
  void dispose() {
    ProductDatabaseManager.instance.close();

    super.dispose();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);
    this.markets = await ProductDatabaseManager.instance.readAllProducts();
    setState(() => isLoading = false);
  }

  Future<bool> update() async {
    refreshProducts();
    return Future.value(true);
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
                        child: RefreshIndicator(
                            onRefresh: () async => await update(),
                            child: ListView.builder(
                                itemCount: ProductDatabaseManager
                                    .currentFavoriteItems.length,
                                itemBuilder: (context, index) {
                                  return FavoriteProducts(
                                    productDescription: ProductDatabaseManager
                                        .currentFavoriteItems[index][0],
                                    productCategory: ProductDatabaseManager
                                        .currentFavoriteItems[index][1],
                                    productImage: ProductDatabaseManager
                                        .currentFavoriteItems[index][2],
                                    oldPrice: ProductDatabaseManager
                                        .currentFavoriteItems[index][3],
                                    newPrice: ProductDatabaseManager
                                        .currentFavoriteItems[index][4],
                                    expirationDate: ProductDatabaseManager
                                        .currentFavoriteItems[index][5],
                                    marketName: ProductDatabaseManager
                                        .currentFavoriteItems[index][6],
                                    product: ProductDatabaseManager
                                        .currentFavoriteItems[index][7],
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
