import 'package:flutter/material.dart';
import 'package:food_rescue/screens/StoresPage/BottomPanel.dart';
import 'package:food_rescue/screens/StoresPage/MapPage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
          body: MyMapPage(),
          panelBuilder: (controller) => BottomPanel(
                controller: controller,
              )),
    );
  }
}
