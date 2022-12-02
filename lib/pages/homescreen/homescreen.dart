// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/homescreen/widgets/greeting.dart';
import 'package:o3_cards/pages/homescreen/widgets/quick_links.dart';
import 'package:o3_cards/ui/export.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FvColors.edittext51Background,
      // backgroundColor: Color.fromARGB(255, 72, 11, 7),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/topcurve.png",
              height: MediaQuery.of(context).size.height - 620,
              color: FvColors.maintheme
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/bottomcurve.png",
          //     height: MediaQuery.of(context).size.height - 170,
          //     width: MediaQuery.of(context).size.width,
          //     color: FvColors.maintheme,
          //   ),
          // ),
          Column(
            children: [
              SizedBox.square(
                dimension: heightOfScreen * 0.02,
              ),
              Greeting(),
              SizedBox.square(
                dimension: heightOfScreen * 0.008,
              ),
              CreditCards(),
              SizedBox.square(
                dimension: heightOfScreen * 0.008,
              ),
              QuickLinks(),
              SizedBox.square(
                dimension: heightOfScreen * 0.008,
              ),
              Activities()
            ],
          ),
        ],
      ),
    );
  }
}
