import 'package:bmc_app/main.dart';
import 'package:bmc_app/pages/home.dart';
import 'package:bmc_app/pages/introduction.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        milliseconds: 5000,
      ),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return isViwed != 0 ? IntroductionScreen() : HomeView();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/pgobernanza.json"),
            ),
          ),
          const Text(
            "B O M A S S",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )),
    );
  }
}
