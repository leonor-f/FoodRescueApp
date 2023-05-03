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
  bool? _apolonia = false;
  bool? _brio = false;
  bool? _meusuper = false;
  bool? _minipreco = false;
  bool? _continente = false;
  bool? _supercor = false;
  bool? _jumbo = false;
  bool? _froiz = false;
  bool? _lidl = false;
  bool? _pingodoce = false;
  bool? _intermache = false;

  bool? _less5 = false;
  bool? _5to10 = false;
  bool? _more10 = false;

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
            'Filtrar por:',
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
            borderRadius: BorderRadius.circular(20),
            child: Container(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                color: Color.fromRGBO(230, 242, 244, 1),
                height: 110,
                width: 360,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Distância:',
                        style: TextStyle(
                          color: Color.fromRGBO(52, 93, 100, 1),
                          fontSize: 15,
                        ),
                      ),
                      Wrap(direction: Axis.horizontal, children: [
                        Container(
                            height: 40,
                            width: 82,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(188, 222, 228, 0.6),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Center(
                                child: Row(children: [
                              Text(
                                '< 5',
                                style: TextStyle(
                                  color: Color.fromRGBO(52, 93, 100, 1),
                                  fontSize: 13,
                                ),
                              ),
                              Checkbox(
                                  activeColor: Color.fromRGBO(52, 93, 100, 1),
                                  value: _less5,
                                  onChanged: (value) {
                                    setState(() {
                                      _less5 = value;
                                    });
                                  })
                            ]))),
                        Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(188, 222, 228, 0.6),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Center(
                                child: Row(children: [
                              Text(
                                '5 - 10',
                                style: TextStyle(
                                  color: Color.fromRGBO(52, 93, 100, 1),
                                  fontSize: 13,
                                ),
                              ),
                              Checkbox(
                                  activeColor: Color.fromRGBO(52, 93, 100, 1),
                                  value: _5to10,
                                  onChanged: (value) {
                                    setState(() {
                                      _5to10 = value;
                                    });
                                  })
                            ]))),
                        Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(188, 222, 228, 0.6),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Center(
                                child: Row(children: [
                              Text(
                                '> 10',
                                style: TextStyle(
                                  color: Color.fromRGBO(52, 93, 100, 1),
                                  fontSize: 13,
                                ),
                              ),
                              Checkbox(
                                  activeColor: Color.fromRGBO(52, 93, 100, 1),
                                  value: _more10,
                                  onChanged: (value) {
                                    setState(() {
                                      _more10 = value;
                                    });
                                  })
                            ]))),
                      ])
                    ])),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                  color: Color.fromRGBO(230, 242, 244, 1),
                  height: 310,
                  width: 360,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lojas:',
                          style: TextStyle(
                            color: Color.fromRGBO(52, 93, 100, 1),
                            fontSize: 15,
                          ),
                        ),
                        Wrap(direction: Axis.horizontal, children: [
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Apolónia',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _apolonia,
                                    onChanged: (value) {
                                      setState(() {
                                        _apolonia = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Jumbo',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _jumbo,
                                    onChanged: (value) {
                                      setState(() {
                                        _jumbo = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Meu Super',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _meusuper,
                                    onChanged: (value) {
                                      setState(() {
                                        _meusuper = value;
                                      });
                                    }),
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Minipreço',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _minipreco,
                                    onChanged: (value) {
                                      setState(() {
                                        _minipreco = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Continente',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _continente,
                                    onChanged: (value) {
                                      setState(() {
                                        _continente = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Supercor',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _supercor,
                                    onChanged: (value) {
                                      setState(() {
                                        _supercor = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Brio',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _brio,
                                    onChanged: (value) {
                                      setState(() {
                                        _brio = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Froiz',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _froiz,
                                    onChanged: (value) {
                                      setState(() {
                                        _froiz = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Lidl',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _lidl,
                                    onChanged: (value) {
                                      setState(() {
                                        _lidl = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Pingo Doce',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _pingodoce,
                                    onChanged: (value) {
                                      setState(() {
                                        _pingodoce = value;
                                      });
                                    })
                              ]))),
                          Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(188, 222, 228, 0.6),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Center(
                                  child: Row(children: [
                                Text(
                                  'Intermaché',
                                  style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontSize: 13,
                                  ),
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(52, 93, 100, 1),
                                    value: _intermache,
                                    onChanged: (value) {
                                      setState(() {
                                        _intermache = value;
                                      });
                                    })
                              ]))),
                        ])
                      ])))
        ],
      ));
}
