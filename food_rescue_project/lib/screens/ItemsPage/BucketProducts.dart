import 'package:flutter/material.dart';
import 'package:food_rescue/models/products.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/screens/ItemsPage/BucketPage.dart';
import 'package:food_rescue/main.dart';

class FavoriteProducts extends StatelessWidget {
  final String productDescription;
  final String productCategory;
  final String productImage;
  final double oldPrice;
  final double newPrice;
  final String expirationDate;
  final String marketName;
  final Product product;

  static const IconData trash = IconData(0xf4c4,
      fontFamily: "CupertinoIcons", fontPackage: "cupertino_icons");

  FavoriteProducts(
      {required this.productDescription,
      required this.productCategory,
      required this.productImage,
      required this.oldPrice,
      required this.newPrice,
      required this.expirationDate,
      required this.marketName,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            color: Color.fromRGBO(217, 217, 217, 0.7),
            height: 120,
            width: 360,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(productImage),
                      )),
                ),
                Positioned(
                    left: 50,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productDescription,
                            style: TextStyle(
                                color: Color.fromRGBO(106, 107, 117, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            'Preço antigo: $oldPrice€',
                            style: TextStyle(
                                color: Color.fromRGBO(106, 107, 117, 1),
                                fontSize: 14),
                          ),
                          Text(
                            'Preço novo: $newPrice€',
                            style: TextStyle(
                                color: Color.fromRGBO(106, 107, 117, 1),
                                fontSize: 14),
                          ),
                          Text(
                            'Data de validade: $expirationDate',
                            style: TextStyle(
                                color: Color.fromRGBO(106, 107, 117, 1),
                                fontSize: 14),
                          ),
                          Text(
                            marketName,
                            style: TextStyle(
                              color: Color.fromRGBO(106, 107, 117, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ])),
                Container(
                    margin: EdgeInsets.fromLTRB(290, 25, 0, 0),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 255, 255, 0.7)),
                    child: InkWell(
                      key: ValueKey('trashbutton'),
                      onTap: () async {
                        await ProductDatabaseManager.instance
                            .updateProductToBuy(product, 'não');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('O item foi removido da sua lista')),
                        );
                        ProductDatabaseManager.currentFavoriteItems
                            .remove(product);
                      },
                      child: Icon(
                        trash,
                        size: 20,
                        color: Color.fromRGBO(106, 107, 117, 1),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
