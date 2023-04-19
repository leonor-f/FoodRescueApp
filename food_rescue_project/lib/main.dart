import 'package:flutter/material.dart';
import 'screens/FavoritesPage/FavoritesPage.dart';
import 'screens/ProductsPage/ProductsPage.dart';
import 'screens/StoresPage.dart';
import 'screens/ItemsPage/BucketPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  static int _selectedIndex = 0;

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
