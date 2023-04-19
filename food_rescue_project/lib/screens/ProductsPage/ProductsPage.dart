import 'package:flutter/material.dart';
import 'package:food_rescue/screens/ProductsPage/ProductsBottomCard.dart';
import 'package:food_rescue/screens/ProductsPage/ProductstopCard.dart';
import 'package:food_rescue/screens/ProductsPage/ProductStores.dart';
import 'dart:async';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/models/products.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopCard(),
          Expanded(
              child: ListView.builder(
                  itemCount: ProductDatabaseManager.allItems.length,
                  itemBuilder: (context, index) {
                    return ProductStores(
                      productDescription: ProductDatabaseManager.allItems[index]
                          [0],
                      productCategory: ProductDatabaseManager.allItems[index]
                          [1],
                      productImage: ProductDatabaseManager.allItems[index][2],
                      oldPrice: ProductDatabaseManager.allItems[index][3],
                      newPrice: ProductDatabaseManager.allItems[index][4],
                      expirationDate: ProductDatabaseManager.allItems[index][5],
                      marketName: ProductDatabaseManager.allItems[index][6],
                      productQuantity: ProductDatabaseManager.allItems[index]
                          [7],
                      product: ProductDatabaseManager.allItems[index][8],
                    );
                  }))
        ],
      ),
    );
  }
}
