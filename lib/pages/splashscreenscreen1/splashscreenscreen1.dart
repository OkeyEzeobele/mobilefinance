import 'package:flutter/material.dart';
import '../../ui/export.dart';

class Splashscreenscreen1 extends StatefulWidget {
  const Splashscreenscreen1({Key? key}) : super(key: key);

  @override
  _Splashscreenscreen1State createState() => _Splashscreenscreen1State();
}

class _Splashscreenscreen1State extends State<Splashscreenscreen1> {
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: FvColors
            .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
        body: Container(
          width: widthOfScreen,
          height: heightOfScreen,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/splash.gif"),
                  fit: BoxFit.fitHeight)),
          child: Column(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.01, top: heightOfScreen * 0.9),
                child: SizedBox(
                  height: heightOfScreen * 0.07,
                  width: widthOfScreen * 0.7,
                  child: TextButton(
                    // ignore: prefer_const_constructors
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: FvColors
                              .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: FvColors
                          .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.31081199645996),
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
                                  const Useronboardingscreen2()));
                    },
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
