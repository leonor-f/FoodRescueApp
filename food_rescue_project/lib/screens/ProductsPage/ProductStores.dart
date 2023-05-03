import 'package:flutter/material.dart';

import 'package:food_rescue/screens/ProductsPage/ProductsCategories.dart';

import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/models/products.dart';

class ProductStores extends StatelessWidget {
  final String productDescription;
  final String productCategory;
  final String productImage;
  final double oldPrice;
  final double newPrice;
  final String expirationDate;
  final String marketName;
  final double productQuantity;
  final Product product;

  ProductStores(
      {required this.productDescription,
      required this.productCategory,
      required this.productImage,
      required this.oldPrice,
      required this.newPrice,
      required this.expirationDate,
      required this.marketName,
      required this.productQuantity,
      required this.product});

  static const IconData trash = IconData(0xf4c4,
      fontFamily: "CupertinoIcons", fontPackage: "cupertino_icons");

  static const IconData add_circled = IconData(0xf48a,
      fontFamily: "CupertinoIcons", fontPackage: "cupertino_icons");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 0, right: 10, bottom: 0),
            color: Color.fromRGBO(217, 217, 217, 0),
            height: 115,
            child: Stack(children: [
              Positioned(
                  left: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          productDescription,
                          style: TextStyle(
                              color: Color.fromRGBO(106, 107, 117, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        Text(
                          'Preço antigo: $oldPrice€',
                          style: TextStyle(
                              color: Color.fromRGBO(106, 107, 117, 1),
                              fontSize: 12),
                        ),
                        Text(
                          'Preço novo: $newPrice€',
                          style: TextStyle(
                              color: Color.fromRGBO(106, 107, 117, 1),
                              fontSize: 12),
                        ),
                        Text(
                          'Data de validade: $expirationDate',
                          style: TextStyle(
                              color: Color.fromRGBO(106, 107, 117, 1),
                              fontSize: 12),
                        ),
                        Text(
                          marketName,
                          style: TextStyle(
                            color: Color.fromRGBO(106, 107, 117, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ])),
              Container(
                  margin: EdgeInsets.fromLTRB(210, 25, 0, 0),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 255, 255, 0.7)),
                  child: InkWell(
                    key: ValueKey('addbutton'),
                    onTap: () async {
                      await ProductDatabaseManager.instance
                          .updateProductToBuy(product, 'sim');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('O item foi adicionado à sua lista')),
                      );
                      ProductDatabaseManager.currentFavoriteItems.add([
                        productDescription,
                        productCategory,
                        product.store_image,
                        oldPrice,
                        newPrice,
                        expirationDate,
                        marketName,
                        product,
                        productImage,
                      ]);
                    },
                    child: Icon(
                      add_circled,
                      size: 20,
                      color: Color.fromRGBO(106, 107, 117, 1),
                    ),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(250, 0, 0, 0),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(productImage),
                )),
              ),
            ]),
          )),
    );
  }
}
