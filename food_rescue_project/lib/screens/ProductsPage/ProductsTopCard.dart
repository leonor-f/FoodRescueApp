import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        height: 150,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromRGBO(188, 222, 228, 0.5),
        ),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Container(
                height: 25,
                width: 90,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Mercearia',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 240,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.5),
                ),
                child: Center(
                    child: Text(
                  'Bio e Escolhas Alimentares',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 90,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Congelados',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 130,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Laticínios e Ovos',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 100,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Peixe e Talho',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 120,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Refeições Fáceis',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 130,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Frutas e Legumes',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 70,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Bebidas',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 165,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Charcutaria e Queijos',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
            Container(
                height: 25,
                width: 165,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(52, 93, 100, 0.2),
                ),
                child: Center(
                    child: Text(
                  'Padaria e Pastelaria',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 93, 100, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ))),
          ],
        ));
  }
}
