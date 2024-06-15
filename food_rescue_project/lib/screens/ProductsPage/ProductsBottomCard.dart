import 'package:flutter/material.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';

bool preco_crescente = true;
bool preco_decrescente = false;
bool validade_crescente = false;
bool validade_decrescente = false;

class BottomPanel extends StatefulWidget {
  static int order_by = 0;
  final ScrollController controller;
  const BottomPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BottomPanelState createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ProductDatabaseManager.instance.close();

    super.dispose();
  }

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
                          InkWell(
                            onTap: () {
                              setState(() {
                                preco_crescente = true;
                                preco_decrescente = false;
                                validade_crescente = false;
                                validade_decrescente = false;
                                BottomPanel.order_by = 0;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: (preco_crescente == false)
                                      ? Color.fromRGBO(188, 222, 228, 0)
                                      : Color.fromRGBO(188, 222, 228, 1)),
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Text(
                                'Preço crescente',
                                style: TextStyle(
                                    color: (preco_crescente == false)
                                        ? Color.fromRGBO(52, 93, 100, 1)
                                        : Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                preco_crescente = false;
                                preco_decrescente = true;
                                validade_crescente = false;
                                validade_decrescente = false;
                                BottomPanel.order_by = 1;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: (preco_decrescente == false)
                                      ? Color.fromRGBO(188, 222, 228, 0)
                                      : Color.fromRGBO(188, 222, 228, 1)),
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Text(
                                'Preço decrescente',
                                style: TextStyle(
                                    color: (preco_decrescente == false)
                                        ? Color.fromRGBO(52, 93, 100, 1)
                                        : Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                preco_crescente = false;
                                preco_decrescente = false;
                                validade_crescente = true;
                                validade_decrescente = false;
                                BottomPanel.order_by = 2;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: (validade_crescente == false)
                                      ? Color.fromRGBO(188, 222, 228, 0)
                                      : Color.fromRGBO(188, 222, 228, 1)),
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Text(
                                'Data de validade crescente',
                                style: TextStyle(
                                    color: (validade_crescente == false)
                                        ? Color.fromRGBO(52, 93, 100, 1)
                                        : Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                preco_crescente = false;
                                preco_decrescente = false;
                                validade_crescente = false;
                                validade_decrescente = true;
                                BottomPanel.order_by = 3;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: (validade_decrescente == false)
                                      ? Color.fromRGBO(188, 222, 228, 0)
                                      : Color.fromRGBO(188, 222, 228, 1)),
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Text(
                                'Data de validade decrescente',
                                style: TextStyle(
                                    color: (validade_decrescente == false)
                                        ? Color.fromRGBO(52, 93, 100, 1)
                                        : Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ])))
          ]));
}
