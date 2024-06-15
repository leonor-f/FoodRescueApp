import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      color: Color.fromRGBO(52, 93, 100, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Procura uma loja e seleciona-a no mapa',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(188, 222, 228, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Lottie.asset(
                                  'assets/animations/tutorial1.json'),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )));
  }
}
