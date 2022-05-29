import 'package:flutter/material.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:o3_cards/pages/loginscreen/model.dart';
// import 'package:o3_cards/services/api_service.dart';

class Loginscreen4 extends StatefulWidget {
  const Loginscreen4({Key? key}) : super(key: key);

  @override
  _Loginscreen4State createState() => _Loginscreen4State();
}

class _Loginscreen4State extends State<Loginscreen4> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: FvColors
            .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: heightOfScreen,
              width: widthOfScreen,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.05,
                        ),
                        child: SizedBox(
                            height: heightOfScreen * 0.05,
                            width: widthOfScreen * 0.08,
                            // ignore: prefer_const_constructors
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                              color: FvColors
                                  .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Useronboardingscreen2()));
                              },
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                        ),
                        child: SizedBox(
                          height: heightOfScreen * 0.08,
                          width: widthOfScreen * 0.5,
                          child: Image.asset(
                              "assets/CapitalLogoIcon_ImageView_46-190x110.png"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: widthOfScreen * 0.04,
                              top: heightOfScreen * 0.08),
                          // ignore: prefer_const_constructors
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            // ignore: prefer_const_constructors
                            child: Text("Don't have an account? Register",
                                textAlign: TextAlign.left,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  color: FvColors.textview50FontColor,
                                  fontWeight: FontWeight.w400,
                                )),
                          )),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: widthOfScreen * 0.13,
                            top: heightOfScreen * 0.08),
                        child: SizedBox(
                          height: heightOfScreen * 0.1,
                          width: widthOfScreen * 0.75,
                          child: TextFormField(
                            cursorColor: FvColors
                                .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: widthOfScreen * 0.04, top: heightOfScreen * 0.014),
                                child: const FaIcon(FontAwesomeIcons.envelope, color: FvColors
                                .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,),),
                              filled: true,
                              fillColor: FvColors.edittext51Background,

                              // ignore: prefer_const_constructors
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: const BorderSide(
                                  color: FvColors
                                      .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: const BorderSide(
                                  color: FvColors
                                      .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                ),
                              ),
                              // label: const Text(
                              //   "Email Address",
                              //   style: TextStyle(
                              //     color: FvColors.screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                              //     fontSize: 14,
                              //   ),
                              // ),
                              hintText: "Email Address",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: widthOfScreen * 0.13,
                            top: heightOfScreen * 0.02),
                        child: SizedBox(
                          height: heightOfScreen * 0.1,
                          width: widthOfScreen * 0.75,
                          child: TextFormField(
                              obscureText: true,
                              cursorColor: FvColors
                                  .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                padding: EdgeInsets.only(left: widthOfScreen * 0.04, top: heightOfScreen * 0.014),
                                child: const FaIcon(FontAwesomeIcons.key, color: FvColors
                                .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,),),
                                filled: true,
                                fillColor: FvColors.edittext51Background,
                                // ignore: prefer_const_constructors
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: const BorderSide(
                                    color: FvColors
                                        .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  // ignore: prefer_const_constructors
                                  borderSide: BorderSide(
                                    color: FvColors
                                        .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                  ),
                                ),
                                // label: const Text(
                                //   "Password",
                                //   style: TextStyle(
                                //     color: FvColors
                                //         .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                //     fontSize: 14,
                                //   ),
                                // ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Theme.of(context).hintColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: widthOfScreen * 0.01,
                            top: heightOfScreen * 0.02),
                        child: SizedBox(
                          height: heightOfScreen * 0.05,
                          width: widthOfScreen * 0.4,
                          child: TextButton(
                            // ignore: prefer_const_constructors
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: const Text(
                                'Sign In',
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
                                borderRadius:
                                    BorderRadius.circular(16.31081199645996),
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
                                          const Homescreen5()));
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: widthOfScreen * 0.355,
                              top: heightOfScreen * 0.02),
                          // ignore: prefer_const_constructors
                          child: Text(
                            "Forgot Password?",
                            textAlign: TextAlign.center,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: FvColors
                                  .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                    // ignore: prefer_const_constructors
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: widthOfScreen * 0.01,
                              top: heightOfScreen * 0.02),
                          child: SizedBox(
                            height: heightOfScreen * 0.1,
                            width: widthOfScreen * 0.3,
                            child: FittedBox(
                              child: IconButton(
                                  icon: const FaIcon(
                                      FontAwesomeIcons.fingerprint),
                                  color: FvColors
                                      .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Useronboardingscreen2()));
                                  }),
                            ),
                          )),
                    ),
                  ]),
            )
          ],
        ));
  }
}
