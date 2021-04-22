import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:villa52/config.dart';
import 'package:villa52/widgets/widget_home_categories.dart';
import 'package:villa52/widgets/widget_home_products.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            imageCarousel(context),
            WidgetCategories(),
            WidgetHomeProducts(
              labelName: "toop",
              tagId: Config.interiorAccentor,
            )
          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        dotSize: 4.0,
        images: [
          FittedBox(
            fit: BoxFit.fill,
            // child: Image.asset("assets/images/logo1.png"),
            child: Image.network(
                "https://images.pexels.com/photos/6437861/pexels-photo-6437861.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/images/2.jpg"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/images/3.jpg"),
          ),
        ],
      ),
    );
  }
}
