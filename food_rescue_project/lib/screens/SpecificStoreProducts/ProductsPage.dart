import 'package:flutter/material.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsBottomCard.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsCategories.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductsPagee extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('Specific_Store_page'),
      body: SlidingUpPanel(
          maxHeight: 240,
          body: ProductPage(),
          panelBuilder: (controller) => BottomPanel(
                controller: controller,
              )),
    );
  }
}
