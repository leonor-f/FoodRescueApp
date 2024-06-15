import 'package:flutter/material.dart';
import 'package:food_rescue/tutorial/ControllerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_rescue/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome
          ? MyMainApp(
              selectedIndex: 0,
            )
          : HomePage(),
    );
  }
}
