import 'package:bmc_app/elements/intro.dart';
import 'package:bmc_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();

  bool OnLastPage = false;
  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("HomeView", isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 1);
              });
            },
            children: const [
              IntroView(
                image: "assets/burning-fat.json",
                text:
                    "Body mass index (BMI) \n is a measure of body fat\n based on height and weight ",
              ),
              IntroView(
                  image: "assets/nutrition.json",
                  text:
                      "Maintaining a healthy\n weight is important for \n your heart health.")
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (() {
                    _controller.jumpToPage(1);
                  }),
                  child: const Text(
                    "SKIP",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 2),
                OnLastPage
                    ? GestureDetector(
                        onTap: () async {
                          await _storeOnBoardInfo();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeView();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "DONE",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(
                              milliseconds: 20,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          "NEXT",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
