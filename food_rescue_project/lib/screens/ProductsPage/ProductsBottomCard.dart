import 'package:flutter/material.dart';

class BottomPanel extends StatefulWidget {
  final ScrollController controller;
  const BottomPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BottomPanelState createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  int order_by = 0;

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 36),
          buildOptions(),
          SizedBox(height: 24),
        ],
      );

  Widget buildOptions() => Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ordenar por:',
              style: TextStyle(
                color: Color.fromRGBO(52, 93, 100, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    color: Color.fromRGBO(230, 242, 244, 1),
                    height: 160,
                    width: 360,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 360,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(188, 222, 228, 0),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Text(
                              'Preço crescente',
                              style: TextStyle(
                                  color: Color.fromRGBO(52, 93, 100, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 360,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(188, 222, 228, 0),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Text(
                              'Preço decrescente',
                              style: TextStyle(
                                  color: Color.fromRGBO(52, 93, 100, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 360,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(188, 222, 228, 1),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Text(
                              'Data de validade crescente',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 360,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(188, 222, 228, 0),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Text(
                              'Data de validade decrescente',
                              style: TextStyle(
                                  color: Color.fromRGBO(52, 93, 100, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])))
          ]));
}
