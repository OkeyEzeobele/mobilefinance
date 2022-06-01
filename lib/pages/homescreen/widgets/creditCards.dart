// ignore_for_file: file_names, prefer_const_constructors

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
  Widget build(BuildContext context){
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
   return Column(
     children:[
       Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.01, top: heightOfScreen * 0.01),
                child: CarouselSlider(
                    items: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: widthOfScreen * 0.009,
                                    top: heightOfScreen * 0.02),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/card_prestige.png')),
                                )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: widthOfScreen * 0.009,
                                    top: heightOfScreen * 0.02),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/card_classic.png')),
                                )),
                          ),
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                      height: heightOfScreen * 0.35,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.8,
                      // autoPlayCurve: Curves.fastOutSlowIn,
                      // aspectRatio: 9/16 ,
                      // autoPlay: true,
                    )),
              )),
     ]
   );

  }
}
