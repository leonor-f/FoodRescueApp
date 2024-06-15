import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:food_rescue/home.dart';

void main() async {
  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyMainApp(
    selectedIndex: 0,
  ));
}
