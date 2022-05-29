import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/export.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Useronboardingscreen2 extends StatefulWidget {
  const Useronboardingscreen2({Key? key}) : super(key: key);

  @override
  _Useronboardingscreen2State createState() => _Useronboardingscreen2State();
}

class _Useronboardingscreen2State extends State<Useronboardingscreen2> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: FvColors
            .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
        body: Container(
          width: widthOfScreen,
          height: heightOfScreen,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              image: const DecorationImage(
            image: AssetImage(
                "assets/CapitalLogoSoloIcon_ImageView_7-1596x1824.png"),
            fit: BoxFit.fitHeight,
          )),
          child: Column(children: [
            CarouselSlider(
                items: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.05,
                                top: heightOfScreen * 0.15),
                            // ignore: prefer_const_constructors
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Instant Credit Cards",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: FvColors
                                        .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                    fontWeight: FontWeight.w700,
                                    fontSize: widthOfScreen * 0.06),
                              ),
                            )),
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
                                "Seamless credit cards, spend with ease",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: FvColors
                                        .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                    fontWeight: FontWeight.w600,
                                    fontSize: widthOfScreen * 0.04),
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.08,
                                top: heightOfScreen * 0.08),
                            child: FittedBox(
                                child: Image.asset("assets/onboardimg.png"))),
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
                                top: heightOfScreen * 0.15),
                            // ignore: prefer_const_constructors
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Simple Payment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: FvColors
                                        .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                    fontWeight: FontWeight.w700,
                                    fontSize: widthOfScreen * 0.06),
                              ),
                            )),
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
                                    color: FvColors
                                        .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                    fontWeight: FontWeight.w600,
                                    fontSize: widthOfScreen * 0.04),
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: widthOfScreen * 0.08,
                                top: heightOfScreen * 0.03),
                            child: FittedBox(
                                child: Image.asset("assets/onboardimg2.png"))),
                      ),
                    ],
                  )
                ],
                options: CarouselOptions(
                  height: heightOfScreen * 0.8,
                  enlargeCenterPage: false,
                  // aspectRatio: 9/16 ,
                  // autoPlay: true,
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.05, top: heightOfScreen * 0.04),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: OutlinedButton(
                    child: const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: FvColors
                          .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          FvColors.container166Background.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // side: const BorderSide(
                        //   width: 1,
                        //   color: Colors.transparent,
                        // ),
                      ),
                    ),
                    onPressed: () {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                // ignore: prefer_const_constructors
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: const Text(
                                                    'Create New Account',
                                                    style: TextStyle(
                                                      color: FvColors
                                                          .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                style: TextButton.styleFrom(
                                                  backgroundColor: FvColors
                                                      .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
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
                                                              const Loginscreen4()));
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
                                                top: heightOfScreen * 0.015),
                                            child: SizedBox(
                                              height: heightOfScreen * 0.07,
                                              width: widthOfScreen * 0.7,
                                              child: TextButton(
                                                // ignore: prefer_const_constructors
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: const Text(
                                                    'Sign In',
                                                    style: TextStyle(
                                                      color: FvColors
                                                          .textview50FontColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                style: TextButton.styleFrom(
                                                  backgroundColor: FvColors
                                                      .edittext51Background,
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
                                                              const Loginscreen4()));
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          });
                    },
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
