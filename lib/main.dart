import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:villa52/screens/routingScreen.dart';
import 'package:villa52/utili/Constants.dart';

void main() {
  return runApp(
    ProviderScope(
      child: MyStoreApp(),
    ),
  );
}

class MyStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () => goToHomeScreen());
  }

  goToHomeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => RoutingScreen(),
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
          Text("My Store Name"),
          SizedBox(
            height: 30,
          ),
          spinkit
        ],
      ),
    );
  }
}
