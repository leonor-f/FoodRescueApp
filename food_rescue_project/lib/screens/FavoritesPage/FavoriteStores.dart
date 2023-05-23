import 'package:flutter/material.dart';
import 'package:food_rescue/home.dart';
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
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            color: Color.fromRGBO(188, 222, 228, 0.7),
            height: 130,
            width: 360,
            child: Stack(children: [
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
                  left: 103,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  $storeName',
                          maxLines: null,
                          style: TextStyle(
                            color: Color.fromRGBO(52, 93, 100, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextButton(
                            onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                        backgroundColor:
                                            Color.fromRGBO(188, 222, 228, 1),
                                        title: const Text(
                                          'Confirmação',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  52, 93, 100, 1),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: const Text(
                                          'Tem a certeza que pretende remover esta loja dos seus favoritos?',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(52, 93, 100, 1),
                                            fontSize: 20,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancelar'),
                                            child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                height: 30,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Color.fromRGBO(
                                                      52, 93, 100, 0.5),
                                                ),
                                                child: Center(
                                                    child: Text('Cancelar',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    188,
                                                                    222,
                                                                    228,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)))),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                await MarketDatabaseManager
                                                    .instance
                                                    .updateFavoriteMarket(
                                                        market, 'não');

                                                MarketDatabaseManager
                                                    .currentFavoriteStores
                                                    .remove(market);

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyMainApp(
                                                              selectedIndex:
                                                                  2)),
                                                );
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 15),
                                                  height: 30,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Color.fromRGBO(
                                                        52, 93, 100, 0.5),
                                                  ),
                                                  child: Center(
                                                      child: Text('Sim',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      188,
                                                                      222,
                                                                      228,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)))))
                                        ])),
                            child: Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                height: 30,
                                width: 205,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(52, 93, 100, 0.5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Remover dos favoritos',
                                        maxLines: null,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(188, 222, 228, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      size: 20,
                                      color: Color.fromRGBO(188, 222, 228, 1),
                                    ),
                                  ],
                                )))
                      ]))
            ])),
      ),
    );
  }
}
