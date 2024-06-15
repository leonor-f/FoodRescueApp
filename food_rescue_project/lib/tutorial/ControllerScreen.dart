import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:food_rescue/tutorial/page_1.dart';
import 'package:food_rescue/tutorial/page_2.dart';
import 'package:food_rescue/tutorial/page_3.dart';
import 'package:food_rescue/tutorial/page_4.dart';
import 'package:food_rescue/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  bool on_last_page = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(188, 222, 228, 1),
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/FoodRescue.png'),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      on_last_page = (index == 3);
                    });
                  },
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                    Page4(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // dot indicators
              Container(
                  alignment: Alignment(0, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      on_last_page
                          ? Text('            ')
                          : GestureDetector(
                              onTap: () {
                                _controller.jumpToPage(3);
                              },
                              child: Text(
                                'Saltar',
                                style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 4,
                        effect: JumpingDotEffect(
                          activeDotColor: Color.fromRGBO(52, 93, 100, 0.8),
                          dotColor: Color.fromRGBO(213, 232, 236, 1),
                          dotHeight: 20,
                          dotWidth: 20,
                          spacing: 16,
                          //verticalOffset: 50,
                          jumpScale: 2,
                        ),
                      ),
                      on_last_page
                          ? GestureDetector(
                              onTap: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('showHome', true);

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyMainApp(selectedIndex: 0);
                                }));
                              },
                              child: Text(
                                'Terminar',
                                style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                'Próximo',
                                style: TextStyle(
                                    color: Color.fromRGBO(52, 93, 100, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
