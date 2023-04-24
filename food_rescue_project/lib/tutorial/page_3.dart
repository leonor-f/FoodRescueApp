import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color.fromRGBO(52, 93, 100, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Guarda as tuas lojas e produtos favoritos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(188, 222, 228, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Lottie.network(
                      'https://assets8.lottiefiles.com/packages/lf20_bnwxm2d1.json'),
                ],
              ),
            ),
          ),
        ));
  }
}
