import 'package:flutter/material.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsBottomCard.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductStores.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/StoreTopCard.dart';
import 'dart:async';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:lottie/lottie.dart';
import 'package:food_rescue/models/markets.dart';

bool mercearia = true;
bool bio = false;
bool congelados = false;
bool laticinios = false;
bool peixe = false;
bool refeicoeFaceis = false;
bool fruta = false;
bool bebidas = false;
bool charcutaria = false;
bool padaria = false;

Market store = Market(
    market_chain_name: "",
    market_name: "",
    market_latitude: 0,
    market_longitude: 0,
    is_favorite: "",
    store_image: "",
    store_pin: "");

class ProductPage extends StatefulWidget {
  static void set_store(Market current_store) {
    store = current_store;
  }

  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<int> temp =
      ProductDatabaseManager.readAllStoreProducts(store.market_name);
  static List<List<dynamic>> allproducts = ProductDatabaseManager.allStoreItems;
  static List<List<dynamic>> itemsCategory = [];
  bool isLoading = false;
  int itemcount = 0;

  @override
  void initState() {
    super.initState();
    refreshCategory();
  }

  @override
  void dispose() {
    ProductDatabaseManager.instance.close();

    super.dispose();
  }

  Future<bool> update() async {
    refreshCategory();
    return Future.value(true);
  }

  @override
  static String get_category() {
    if (mercearia == true) {
      return "Mercearia";
    }
    if (bio == true) {
      return "Bio e Escolhas Alimentares";
    }
    if (congelados == true) {
      return "Congelados";
    }
    if (laticinios == true) {
      return "Laticínios e Ovos";
    }
    if (peixe == true) {
      return "Peixe e Talho";
    }
    if (refeicoeFaceis == true) {
      return "Refeições Fáceis";
    }
    if (fruta == true) {
      return "Frutas e Legumes";
    }
    if (bebidas == true) {
      return "Bebidas";
    }
    if (charcutaria == true) {
      return "Charcutaria e Queijos";
    }
    return "Padaria e Pastelaria";
  }

  @override
  static void readAllProducts() {
    itemsCategory.clear();

    for (int i = 0; i < allproducts.length; i++) {
      if (allproducts[i][1] == get_category()) {
        itemsCategory.add([
          allproducts[i][0],
          allproducts[i][1],
          allproducts[i][2],
          allproducts[i][3],
          allproducts[i][4],
          allproducts[i][5],
          allproducts[i][6],
          allproducts[i][7],
          allproducts[i][8],
          allproducts[i][9],
        ]);
      }
    }
  }

  void refreshCategory() async {
    setState(() => isLoading = true);
    itemsCategory.clear();
    readAllProducts();
    itemcount = itemsCategory.length;
    if (BottomPanel.order_by == 0) {
      itemsCategory.sort((a, b) => a[4].compareTo(b[4]));
    } else if (BottomPanel.order_by == 1) {
      itemsCategory.sort((a, b) => b[4].compareTo(a[4]));
    } else if (BottomPanel.order_by == 2) {
      itemsCategory.sort((a, b) => a[5].compareTo(b[5]));
    } else {
      itemsCategory.sort((a, b) => b[5].compareTo(a[5]));
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    refreshCategory();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        TopCard(
          market: store,
          is_fav: store.is_favorite,
        ),
        Container(
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
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = true;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 90,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (mercearia == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = true;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 240,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (bio == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = true;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 90,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (congelados == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = true;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 130,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (laticinios == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = true;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 100,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (peixe == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = true;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 120,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (refeicoeFaceis == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = true;
                      bebidas = false;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 130,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (fruta == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = true;
                      charcutaria = false;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 70,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (bebidas == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = true;
                      padaria = false;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 165,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (charcutaria == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      mercearia = false;
                      bio = false;
                      congelados = false;
                      laticinios = false;
                      peixe = false;
                      refeicoeFaceis = false;
                      fruta = false;
                      bebidas = false;
                      charcutaria = false;
                      padaria = true;
                      refreshCategory();
                    });
                  },
                  child: Container(
                      height: 25,
                      width: 165,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: (padaria == false)
                            ? Color.fromRGBO(52, 93, 100, 0.2)
                            : Color.fromRGBO(52, 93, 100, 0.5),
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
                ),
              ],
            )),
        Expanded(
            child: RefreshIndicator(
                onRefresh: () async => await update(),
                color: Color.fromRGBO(188, 222, 228, 1),
                child: (itemcount == 0)
                    ? Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        color: Color.fromRGBO(52, 93, 100, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 85,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              color: Color.fromRGBO(52, 93, 100, 0),
                              child: Lottie.asset('assets/animations/sad.json'),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Nenhum produto disponível nesta categoria.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 146, 146, 0.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Tente voltar mais tarde.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 146, 146, 0.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: itemcount,
                        itemBuilder: (context, index) {
                          return ProductStores(
                            productDescription: itemsCategory[index][0],
                            productCategory: itemsCategory[index][1],
                            productImage: itemsCategory[index][2],
                            oldPrice: itemsCategory[index][3],
                            newPrice: itemsCategory[index][4],
                            expirationDate: itemsCategory[index][5],
                            marketName: itemsCategory[index][6],
                            productQuantity: itemsCategory[index][7],
                            product: itemsCategory[index][8],
                          );
                        }))),
      ]),
    );
  }
}
