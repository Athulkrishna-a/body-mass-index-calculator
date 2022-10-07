import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key, required this.image, required this.text});
  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Center(
              child: Lottie.asset(image),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
