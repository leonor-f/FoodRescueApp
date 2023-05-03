import 'package:flutter/material.dart';
import 'package:food_rescue/models/products.dart';
import 'package:food_rescue/screens/ProductsPage/ProductPage.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';

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

class TopCard extends StatefulWidget {
  static List<List<dynamic>> itemsCategory = [];

  @override
  _TopCardState createState() => _TopCardState();

  static void refresh() {
    _TopCardState.readAllProducts();
  }
}

class _TopCardState extends State<TopCard> {
  late List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProducts();
  }

  @override
  void dispose() {
    ProductDatabaseManager.instance.close();

    super.dispose();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);
    this.products = await ProductDatabaseManager.instance.readAllProducts();
    setState(() => isLoading = false);
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
    List<List<dynamic>> allproducts = ProductDatabaseManager.allItems;
    TopCard.itemsCategory.clear();

    for (int i = 0; i < allproducts.length; i++) {
      final String product_description = allproducts[i][0];
      final String product_category = allproducts[i][1];
      final String product_image = allproducts[i][2];
      final double old_price = allproducts[i][3];
      final double new_price = allproducts[i][4];
      final String expiration_date = allproducts[i][5];
      final String market_name = allproducts[i][6];
      final double quantity = allproducts[i][7];
      final Product product = allproducts[i][8];
      final String store_image = allproducts[i][9];

      if (product_category == get_category()) {
        TopCard.itemsCategory.add([
          product_description,
          product_category,
          product_image,
          old_price,
          new_price,
          expiration_date,
          market_name,
          quantity,
          product,
          store_image,
        ]);
      }
    }
  }

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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
                  readAllProducts();
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
        ));
  }
}
