import 'package:flutter/material.dart';

class FavoriteProducts extends StatelessWidget {
  final String productName;
  final String productPrice;

  FavoriteProducts({required this.productName, required this.productPrice});
  // {
  //   print('productName: $productName');
  // print('productPrice: $productPrice');
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            color: Color.fromRGBO(217, 217, 217, 0.7),
            height: 90,
            width: 360,
            child: Stack(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                ),
                Positioned(
                    left: 50,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            productName,
                            style: TextStyle(
                              color: Color.fromRGBO(106, 107, 117, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]))
              ],
            )),
      ),
    );
  }
}
