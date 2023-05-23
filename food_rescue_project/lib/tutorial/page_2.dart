import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

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
                    'Escolhe os produtos que mais te agradam',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(188, 222, 228, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Lottie.asset('assets/animations/tutorial2.json'),
                ],
              ),
            ),
          ),
        ));
  }
}
