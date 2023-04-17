import 'package:flutter/material.dart';
import 'package:food_rescue/screens/FavoritesPage/FavoritesPage.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:food_rescue/models/markets.dart';

class FavoriteStores extends StatelessWidget {
  final String storeName;
  final String storeImage;
  final Market market;

  FavoriteStores(
      {required this.storeName,
      required this.storeImage,
      required this.market});

  static const IconData trash = IconData(0xf4c4,
      fontFamily: "CupertinoIcons", fontPackage: "cupertino_icons");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              color: Color.fromRGBO(188, 222, 228, 0.7),
              height: 130,
              width: 360,
              child: Stack(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(storeImage),
                        )),
                  ),
                  Positioned(
                      top: 8,
                      left: 110,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              storeName,
                              style: TextStyle(
                                color: Color.fromRGBO(52, 93, 100, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 30,
                                width: 205,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(52, 93, 100, 0.5),
                                ),
                                child: InkWell(
                                    onTap: () async {
                                      await MarketDatabaseManager.instance
                                          .updateFavoriteMarket(market);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'A loja foi removida dos favoritos')),
                                      );
                                      MarketDatabaseManager
                                          .currentFavoriteStores
                                          .remove(market);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Remover dos favoritos  ',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                188, 222, 228, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          size: 20,
                                          color:
                                              Color.fromRGBO(188, 222, 228, 1),
                                        ),
                                      ],
                                    )))
                          ])),
                ],
              ))),
    );
  }
}
