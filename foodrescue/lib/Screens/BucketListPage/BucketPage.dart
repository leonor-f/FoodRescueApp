import 'package:flutter/material.dart';

class FavoriteProducts extends StatelessWidget {
  final String productName;

  FavoriteProducts({required this.productName});

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
                      )),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        productName,
                        style: TextStyle(
                          color: Color.fromRGBO(52, 93, 100, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
