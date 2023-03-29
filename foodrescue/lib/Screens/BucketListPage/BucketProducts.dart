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
                    ),
                    child: Center(
                        child: Text(productPrice,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )))),
                Positioned(
                    left: 100,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            productName,
                            style: TextStyle(
                              color: Color.fromRGBO(52, 93, 100, 1),
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
