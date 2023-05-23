import 'dart:async';
import 'package:flutter/material.dart';
import 'BucketTopCard.dart';
import 'BucketProducts.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/models/products.dart';
import 'package:lottie/lottie.dart';

class BucketPage extends StatefulWidget {
  const BucketPage({Key? key}) : super(key: key);

  @override
  _BucketPageState createState() => _BucketPageState();
}

class _BucketPageState extends State<BucketPage> {
  late List<Product> products = [];
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
    this.products = await ProductDatabaseManager.instance.readAllProducts();
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
                            color: Color.fromRGBO(188, 222, 228, 1),
                            child: (ProductDatabaseManager
                                        .currentFavoriteItems.length ==
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
                                            'Ainda nenhum produto',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  153, 146, 146, 0.8),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'foi adicionado.',
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
                                    itemCount: ProductDatabaseManager
                                        .currentFavoriteItems.length,
                                    itemBuilder: (context, index) {
                                      return FavoriteProducts(
                                        productDescription:
                                            ProductDatabaseManager
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
