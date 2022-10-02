// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o3_cards/pages/signup/signup.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../services/shared_service.dart';


class Useronboardingscreen2 extends StatefulWidget {
  const Useronboardingscreen2({Key? key}) : super(key: key);

  @override
  _Useronboardingscreen2State createState() => _Useronboardingscreen2State();
}

class _Useronboardingscreen2State extends State<Useronboardingscreen2> {
  late Future<bool> userProfile;

  Future<bool> _getProfile() async {
    bool model = await SharedService.isLoggedIn();
    return model;
  }

  @override
  void initState() {
    super.initState();
    userProfile = _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        width: widthOfScreen,
        height: heightOfScreen + 24,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/onboardbgrd.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.05,
                          top: heightOfScreen * 0.15,
                        ),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Instant Credit Cards",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FvColors.offwhite,
                              fontWeight: FontWeight.w700,
                              fontSize: widthOfScreen * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.05,
                          top: heightOfScreen * 0.02,
                        ),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Seamless credit cards, spend with ease",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FvColors.offwhite,
                              fontWeight: FontWeight.w600,
                              fontSize: widthOfScreen * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.08,
                          top: heightOfScreen * 0.08,
                        ),
                        child: Image.asset(
                          "assets/onboardimg.png",
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.05,
                          top: heightOfScreen * 0.15,
                        ),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Simple Payments",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: FvColors.offwhite,
                                fontWeight: FontWeight.w700,
                                fontSize: widthOfScreen * 0.05),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: widthOfScreen * 0.05,
                            top: heightOfScreen * 0.02),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Keep up with your bills, and pay friends\n"
                            "and businesses",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: FvColors.offwhite,
                                fontWeight: FontWeight.w600,
                                fontSize: widthOfScreen * 0.03),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.08,
                          top: heightOfScreen * 0.03,
                        ),
                        child: Image.asset(
                          "assets/onboardimg2.png",
                        ),
                      ),
                    ),
                  ],
                )
              ],
              options: CarouselOptions(
                height: heightOfScreen * 0.8,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                // viewportFraction: 0,
                // aspectRatio: 9/16 ,
                autoPlay: true,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: widthOfScreen * 0.05,
                  top: heightOfScreen * 0.04,
                ),
                child: SizedBox(
                  height: heightOfScreen * 0.1,
                  width: widthOfScreen * 0.2,
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: heightOfScreen * 0.03,
                      backgroundColor:
                          FvColors.container166Background.withOpacity(0.5),
                      child: FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: FvColors.offwhite,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        builder: (context) {
                          return SizedBox(
                            height: heightOfScreen * 0.25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: widthOfScreen * 0.01,
                                            top: heightOfScreen * 0.05),
                                        child: SizedBox(
                                          height: heightOfScreen * 0.07,
                                          width: widthOfScreen * 0.7,
                                          child: TextButton(
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: const Text(
                                                'Create New Account',
                                                style: TextStyle(
                                                  color: FvColors.offwhite,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ),
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  FvColors.maintheme,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.31081199645996),
                                                side: const BorderSide(
                                                  width: 1,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Signupscreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: widthOfScreen * 0.01,
                                          top: heightOfScreen * 0.015,
                                        ),
                                        child: SizedBox(
                                          height: heightOfScreen * 0.07,
                                          width: widthOfScreen * 0.7,
                                          child: TextButton(
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: const Text(
                                                'Sign In',
                                                style: TextStyle(
                                                  color: FvColors
                                                      .textview50FontColor,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ),
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  FvColors.textview79FontColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  16.31081199645996,
                                                ),
                                                side: const BorderSide(
                                                  width: 1,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Loginscreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
