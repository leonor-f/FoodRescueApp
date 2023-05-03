import 'package:flutter/material.dart';
import 'package:food_rescue/screens/ProductsPage/ProductsBottomCard.dart';


import 'package:food_rescue/screens/ProductsPage/ProductsCategories.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
          body: ProductPage(),
          panelBuilder: (controller) => BottomPanel(
                controller: controller,
              )),
    );
  }
}
