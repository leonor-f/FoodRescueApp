import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        height: 50,
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'O seu cesto de compras',
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

