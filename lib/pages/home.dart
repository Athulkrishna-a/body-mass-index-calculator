import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController _height = TextEditingController();

  TextEditingController _weight = TextEditingController();
  double _bmresult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        backgroundColor: Colors.tealAccent,
        title: const Text(
          "B O M A S S",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 3)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 254, 48, 2),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "HEIGHT",
                        labelStyle: const TextStyle(
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: _weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 3)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 254, 48, 2),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "WEIGHT",
                        labelStyle: const TextStyle(
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 100.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Background color
                        ),
                        onPressed: () {
                          double _h = double.parse(_height.text);
                          double _w = double.parse(_weight.text);
                          setState(() {
                            _bmresult = _w / (_h * _h);
                            if (_bmresult > 25) {
                              _textResult = "OVER  WEIGHT";
                            } else if (_bmresult >= 18.5 && _bmresult <= 25) {
                              _textResult = "NORMAL WEIGHT";
                            } else {
                              _textResult = "UNDER WEIGHT";
                            }
                          });
                        },
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: Text(
                        _bmresult.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      visible: _textResult.isNotEmpty,
                      child: SizedBox(
                        child: Text(
                          _textResult,
                          style: const TextStyle(
                            letterSpacing: 0.4,
                            color: Colors.redAccent,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          height: 100.0,
                          width: 80.0,
                          child: Lottie.asset("assets/pumpkin.json"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
