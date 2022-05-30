// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/export.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class Homescreen5 extends StatefulWidget {
  const Homescreen5({Key? key}) : super(key: key);

  @override
  _Homescreen5State createState() => _Homescreen5State();
}

class _Homescreen5State extends State<Homescreen5> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.05, top: heightOfScreen * 0.05),
                child: Text(
                  "Hello",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: widthOfScreen * 0.04,
                    color: FvColors.textview70FontColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          Row(children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.05, top: heightOfScreen * 0.01),
                child: Text(
                  "First Name,",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: widthOfScreen * 0.05,
                      color: FvColors.textview50FontColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(
                      left: widthOfScreen * 0.08, top: heightOfScreen * 0.0009),
                  child: Container(
                      width: widthOfScreen * 0.4,
                      height: heightOfScreen * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(181),
                        color: FvColors
                            .container58Backgroundcontainer72Backgroundcontainer73Backgroundcontainer141Backgroundcontainer142Backgroundcontainer146Backgroundcontainer147Backgroundcontainer161Backgroundcontainer162Background,
                      ),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: widthOfScreen * 0.04,
                                    top: heightOfScreen * 0.01),
                                child: Text(
                                  "Add Credit Card",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: widthOfScreen * 0.035,
                                    color: FvColors
                                        .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: widthOfScreen * 0.02,
                                  top: heightOfScreen * 0.0001),
                              child: FittedBox(
                                // height: heightOfScreen * 0.04,
                                // width: widthOfScreen * 0.04,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Loginscreen4()));
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.circlePlus,
                                    color: FvColors
                                        .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.03, top: heightOfScreen * 0.01),
                child: OutlinedButton(
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: FvColors.textview50FontColor,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: FvColors.edittext51Background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      // side: const BorderSide(
                      //   width: 1,
                      //   color: Colors.transparent,
                      // ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginscreen4()));
                  },
                ),
              ),
            ),
          ]),
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
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: widthOfScreen * 0.05, top: 0),
              child: Card(
                elevation: 5,
                shadowColor: Colors.grey,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: heightOfScreen * 0.13,
                  width: widthOfScreen * 0.89,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.063,
                                top: heightOfScreen * 0.02),
                            child: SizedBox(
                              height: heightOfScreen * 0.07,
                              width: widthOfScreen * 0.15,
                              child: OutlinedButton(
                                child: const FaIcon(
                                  FontAwesomeIcons.locationArrow,
                                  color: FvColors
                                      .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                  size: 24,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.04,
                                top: heightOfScreen * 0.02),
                            child: SizedBox(
                              height: heightOfScreen * 0.07,
                              width: widthOfScreen * 0.15,
                              child: OutlinedButton(
                                child: const FaIcon(
                                  FontAwesomeIcons.wallet,
                                  color: FvColors
                                      .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                  size: 24,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.04,
                                top: heightOfScreen * 0.02),
                            child: SizedBox(
                              height: heightOfScreen * 0.07,
                              width: widthOfScreen * 0.15,
                              child: OutlinedButton(
                                child: const FaIcon(
                                  FontAwesomeIcons.solidCreditCard,
                                  color: FvColors
                                      .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                  size: 24,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.056,
                                top: heightOfScreen * 0.02),
                            child: SizedBox(
                              height: heightOfScreen * 0.07,
                              width: widthOfScreen * 0.15,
                              child: OutlinedButton(
                                child: const FaIcon(
                                  FontAwesomeIcons.gift,
                                  color: FvColors
                                      .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                  size: 24,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.0865,
                                top: heightOfScreen * 0.01),
                            child: Text(
                              "Transfer",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: widthOfScreen * 0.025,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.1,
                                top: heightOfScreen * 0.01),
                            child: Text(
                              "Pay Bills",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: widthOfScreen * 0.025,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.065,
                                top: heightOfScreen * 0.01),
                            child: Text(
                              "Fund O3 Card",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: widthOfScreen * 0.025,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.08,
                                top: heightOfScreen * 0.01),
                            child: Text(
                              "Rewards",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: widthOfScreen * 0.025,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
