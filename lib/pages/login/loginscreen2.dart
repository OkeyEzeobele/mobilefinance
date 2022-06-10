import 'package:flutter/material.dart';
import 'package:o3_cards/pages/login/widgets/loginForm.dart';
// import 'package:o3_cards/pages/login/auth.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:o3_cards/pages/loginscreen/model.dart';
// import 'package:o3_cards/services/api_service.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // final AuthAPI _authAPI = AuthAPI();
  // final _key = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: FvColors.offwhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: heightOfScreen,
              width: widthOfScreen,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //       left: widthOfScreen * 0.05,
                    //     ),
                    //     child: SizedBox(
                    //         height: heightOfScreen * 0.05,
                    //         width: widthOfScreen * 0.08,
                    //         // ignore: prefer_const_constructors
                    //         child: IconButton(
                    //           icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                    //           color: FvColors.maintheme,
                    //           onPressed: () {
                    //             Navigator.pushReplacement(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         const Useronboardingscreen2()));
                    //           },
                    //         )),
                    //   ),
                    // ),
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
                    const LoginForm(),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         left: widthOfScreen * 0.13,
                    //         top: heightOfScreen * 0.08),
                    //     child: SizedBox(
                    //       height: heightOfScreen * 0.1,
                    //       width: widthOfScreen * 0.75,
                    //       child: TextFormField(
                    //         cursorColor: FvColors.maintheme,
                    //         textAlign: TextAlign.center,
                    //         decoration: InputDecoration(
                    //           prefixIcon: Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: widthOfScreen * 0.04,
                    //                 top: heightOfScreen * 0.014),
                    //             child: const FaIcon(
                    //               FontAwesomeIcons.envelope,
                    //               color: FvColors.maintheme,
                    //             ),
                    //           ),
                    //           filled: true,
                    //           fillColor: FvColors.edittext51Background,

                    //           // ignore: prefer_const_constructors
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(35),
                    //             borderSide: const BorderSide(
                    //               color: FvColors
                    //                   .offwhite,
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(35),
                    //             borderSide: const BorderSide(
                    //               color: FvColors
                    //                   .offwhite,
                    //             ),
                    //           ),
                    //           // label: const Text(
                    //           //   "Email Address",
                    //           //   style: TextStyle(
                    //           //     color: FvColors.maintheme,
                    //           //     fontSize: 14,
                    //           //   ),
                    //           // ),
                    //           hintText: "Email Address",
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(25),
                    //           ),
                    //         ),
                    //         onChanged: (val) => setState(() {
                    //           email = val;
                    //         }),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         left: widthOfScreen * 0.13,
                    //         top: heightOfScreen * 0.02),
                    //     child: SizedBox(
                    //       height: heightOfScreen * 0.1,
                    //       width: widthOfScreen * 0.75,
                    //       child: TextFormField(
                    //         obscureText: true,
                    //         cursorColor: FvColors.maintheme,
                    //         textAlign: TextAlign.center,
                    //         decoration: InputDecoration(
                    //           prefixIcon: Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: widthOfScreen * 0.04,
                    //                 top: heightOfScreen * 0.014),
                    //             child: const FaIcon(
                    //               FontAwesomeIcons.key,
                    //               color: FvColors.maintheme,
                    //             ),
                    //           ),
                    //           filled: true,
                    //           fillColor: FvColors.edittext51Background,
                    //           // ignore: prefer_const_constructors
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(35),
                    //             borderSide: const BorderSide(
                    //               color: FvColors
                    //                   .offwhite,
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(35),
                    //             // ignore: prefer_const_constructors
                    //             borderSide: BorderSide(
                    //               color: FvColors
                    //                   .offwhite,
                    //             ),
                    //           ),
                    //           // label: const Text(
                    //           //   "Password",
                    //           //   style: TextStyle(
                    //           //     color: FvColors
                    //           //         .maintheme,
                    //           //     fontSize: 14,
                    //           //   ),
                    //           // ),
                    //           hintText: "Password",
                    //           hintStyle:
                    //               TextStyle(color: Theme.of(context).hintColor),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(1),
                    //           ),
                    //         ),
                    //         keyboardType: TextInputType.visiblePassword,
                    //         onChanged: (val) => setState(() {
                    //           password = val;
                    //         }),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         left: widthOfScreen * 0.01,
                    //         top: heightOfScreen * 0.02),
                    //     child: SizedBox(
                    //       height: heightOfScreen * 0.05,
                    //       width: widthOfScreen * 0.4,
                    //       child: TextButton(
                    //         // ignore: prefer_const_constructors
                    //         child: FittedBox(
                    //           fit: BoxFit.fitWidth,
                    //           child: const Text(
                    //             'Sign In',
                    //             style: TextStyle(
                    //               color: FvColors
                    //                   .offwhite,
                    //               fontWeight: FontWeight.w900,
                    //             ),
                    //           ),
                    //         ),
                    //         style: TextButton.styleFrom(
                    //           backgroundColor: FvColors.maintheme,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius:
                    //                 BorderRadius.circular(16.31081199645996),
                    //             side: const BorderSide(
                    //               width: 1,
                    //               color: Colors.transparent,
                    //             ),
                    //           ),
                    //         ),
                    //         onPressed: () {
                    //           Navigator.pushReplacement(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       const Dashboard()));
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                              color: FvColors.maintheme,
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
                                  color: FvColors.maintheme,
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
