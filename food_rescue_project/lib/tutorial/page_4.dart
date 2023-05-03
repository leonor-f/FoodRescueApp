import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(20),
              color: Color.fromRGBO(52, 93, 100, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Poupa dinheiro e ajuda o ambiente!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(188, 222, 228, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Lottie.network(
                      'https://assets9.lottiefiles.com/private_files/lf30_p6kiqhxf.json'),
                ],
              ),
            ),
          ),
        ));
  }
}
