import 'package:flutter/material.dart';
import 'screens/FavoritesPage/FavoritesPage.dart';
import 'screens/ProductsPage.dart';
import 'screens/StoresPage.dart';
import 'screens/ItemsPage/BucketPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_rescue/tutorial/ControllerScreen.dart';
import 'package:food_rescue/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
