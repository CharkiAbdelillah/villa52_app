import 'dart:async';

import 'package:flutter_riverpod/all.dart';
import 'package:flutter/material.dart';
import 'package:villa52/Home_Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  return runApp(ProviderScope(
    child: MaterialApp(
      home: SplashScreen(),
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  static final name = " SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => goToHomeScreen());
  }

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );
  goToHomeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  height: 100, child: Image.asset("assets/images/logo.png"))),
          SizedBox(
            height: 30,
          ),
          Text("Bienvenue sur Villa52"),
          SizedBox(
            height: 30,
          ),
          spinkit
        ],
      ),
    );
  }
}
