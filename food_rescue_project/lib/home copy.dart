import 'package:flutter/material.dart';
import 'screens/FavoritesPage/FavoritesPage.dart';
import 'screens/ProductsPage/ProductsPage.dart';
import 'screens/SpecificStoreProducts/ProductsPage.dart';
import 'screens/ItemsPage/BucketPage.dart';

class MyApp_second_bar extends StatelessWidget {
  final int selectedIndex;

  MyApp_second_bar({
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
        selectedIndex: selectedIndex,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final int selectedIndex;

  MyStatefulWidget({
    required this.selectedIndex,
  });

  @override
  State<MyStatefulWidget> createState() =>
      _MyStatefulWidgetState(selectedIndex: selectedIndex);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int selectedIndex;
  _MyStatefulWidgetState({
    required this.selectedIndex,
  });

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final screens = [
    ProductsPagee(),
    ProductsPage(),
    FavoritesPage(),
    BucketPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(selectedIndex),
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
        currentIndex: selectedIndex,
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 1),
        selectedItemColor: Color.fromRGBO(52, 93, 100, 1),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
