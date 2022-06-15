// ignore_for_file: file_names, prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({Key? key}) : super(key: key);

  @override
  _CreditCardsState createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: [
            Column(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Image(image: AssetImage('assets/card_prestige.png')),
                ),
              ],
            ),
            Column(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Image(image: AssetImage('assets/card_classic.png')),
                ),
              ],
            ),
          ],
          options: CarouselOptions(
            height: heightOfScreen * 0.30,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            // autoPlayCurve: Curves.fastOutSlowIn,
            // aspectRatio: 9/16 ,
            // autoPlay: true,
          ),
        ),
      ],
    );
  }
}
