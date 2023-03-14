import 'package:flutter/material.dart';

class FavoriteStores extends StatelessWidget {
  final String storeName;

  FavoriteStores({required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Color.fromRGBO(188, 222, 228, 0.7),
            height: 130,
            width: 360,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(storeName),
                ],
              ),
            ),
          ),
        ));
  }
}
