import 'package:flutter/material.dart';
import 'screens/FavoritesPage/FavoritesPage.dart';
import 'screens/ItemsPage.dart';
import 'screens/ProductsPage.dart';
import 'screens/StoresPage.dart';
import 'Sheets/StoresProduct.dart';
import 'screens/ItemsPage/BucketPage.dart';
//import 'package:food_rescue/services/database_helper.dart';
//import 'package:food_rescue/models/user_model.dart';

void main() async {
  GoogleSheetsApi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final screens = [
    MyMapPage(),
    ProductsPage(),
    FavoritesPage(),
    BucketPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Lojas',
            backgroundColor: Color.fromRGBO(230, 242, 244, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Produtos',
            backgroundColor: Color.fromRGBO(230, 242, 244, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
            backgroundColor: Color.fromRGBO(230, 242, 244, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Items',
            backgroundColor: Color.fromRGBO(230, 242, 244, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 1),
        selectedItemColor: Color.fromRGBO(52, 93, 100, 1),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
