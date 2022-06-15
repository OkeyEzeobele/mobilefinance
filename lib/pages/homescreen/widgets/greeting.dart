// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o3_cards/pages/login/loginscreen.dart';
import 'package:o3_cards/services/shared_service.dart';
import 'package:o3_cards/ui/pallete.dart';

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  @override
  void initState() {
    super.initState();
  }

  String _firstname = '';
  _GreetingState() {
    getTextFromFile().then(
      (val) => setState(() {
        _firstname = val;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: widthOfScreen * 0.05, top: heightOfScreen * 0.05),
              child: SizedBox(
                width: widthOfScreen * 0.25,
                child: AutoSizeText.rich(
                  TextSpan(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(
                          text: 'How are you?\n',
                          style: TextStyle(
                              fontSize: 12,
                              color: FvColors.textview70FontColor,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: _firstname,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: FvColors.textview50FontColor,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                    ],
                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 10,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.08, top: heightOfScreen * 0.05),
                child: Container(
                    width: widthOfScreen * 0.45,
                    height: heightOfScreen * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(181),
                      color: FvColors.offwhitepink,
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
                                  color: FvColors.maintheme,
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
                                          builder: (context) => Loginscreen()));
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: FvColors.maintheme,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  left: widthOfScreen * 0.02, top: heightOfScreen * 0.05),
              child: GestureDetector(
                child: CircleAvatar(
                  radius: heightOfScreen * 0.02,
                  backgroundColor: FvColors.textview79FontColor,
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: FvColors.textview50FontColor,
                  ),
                ),
                onTap: () {
                  SharedService.logout(context);
                },
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var name = userDetails!.payload!.user!.fullName;
    return name.substring(0, name.indexOf(' '));
  }
}
