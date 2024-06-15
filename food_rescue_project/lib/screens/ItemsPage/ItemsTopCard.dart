
import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Container(
        height: 50,
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Produtos que planeia comprar',
              style: TextStyle(
                color: Color.fromRGBO(52, 93, 100, 1),
                fontSize: 20,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(188, 222, 228, 0.5),
        ),
      ),
    );
  }
}
