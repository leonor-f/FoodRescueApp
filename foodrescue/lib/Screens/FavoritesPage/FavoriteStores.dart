import 'package:flutter/material.dart';

class FavoriteStores extends StatelessWidget {
  final String storeName;
  final String storeImage;

  FavoriteStores({required this.storeName, required this.storeImage});

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
            child: Row(
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
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        storeName,
                        style: TextStyle(
                          color: Color.fromRGBO(52, 93, 100, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    /*Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      height: 30,
                      width: 215,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(52, 93, 100, 0.5),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              'Remover dos favoritos',
                              style: TextStyle(
                                color: Color.fromRGBO(188, 222, 228, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                )
              ],
            )),
      ),
    );
  }
}
