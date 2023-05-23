import 'package:flutter/material.dart';
import 'package:food_rescue/services/ProductsDatabaseManager.dart';
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:food_rescue/models/markets.dart';
import 'package:food_rescue/home.dart';

class TopCard extends StatefulWidget {
  final Market market;
  String is_fav;

  TopCard({required this.market, required this.is_fav});

  void set_fav(String is_favorite) {
    is_fav = is_favorite;
  }

  @override
  _TopCardState createState() => _TopCardState(market: market, is_fav: is_fav);
}

class _TopCardState extends State<TopCard> {
  Market market;
  String is_fav;

  _TopCardState({required this.market, required this.is_fav});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ProductDatabaseManager.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 25, 5, 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyMainApp(selectedIndex: 0)),
                ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(217, 217, 217, 0.7)),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            )),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                market.market_name,
                style: TextStyle(
                  color: Color.fromRGBO(52, 93, 100, 1),
                  fontSize: 20,
                ),
              ),
              backgroundColor: Color.fromRGBO(188, 222, 228, 1),
            ),
          ),
          child: Container(
            height: 50,
            width: 260,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Center(
              child: Text(
                market.market_name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color.fromRGBO(52, 93, 100, 1),
                  fontSize: 20,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(188, 222, 228, 0.5),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            is_fav = market.is_favorite;
            if (is_fav == 'não') {
              await MarketDatabaseManager.instance
                  .updateFavoriteMarket(market, 'sim');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('A loja foi adicionada aos seus favoritos')),
              );
              MarketDatabaseManager.currentFavoriteStores
                  .add([market.market_name, market.store_image, market]);
              setState(() {
                is_fav = 'sim';
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('A loja já está nos seus favoritos')),
              );
            }
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: (is_fav == 'não')
                  ? Color.fromRGBO(188, 222, 228, 0.9)
                  : Color.fromRGBO(201, 73, 64, 1),
            ),
            child: Icon(
              Icons.favorite,
              size: 20,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
