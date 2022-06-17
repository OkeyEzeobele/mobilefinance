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
      (val) => setState(
        () {
          _firstname = val;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning,';
      }
      if (hour < 17) {
        return 'Good Afternoon,';
      }
      return 'Good Evening,';
    }

    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: widthOfScreen * 0.25,
              height: heightOfScreen * 0.035,
              child: FittedBox(
                child: AutoSizeText.rich(
                  TextSpan(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(
                        text: _greeting() + '\n',
                        style: TextStyle(
                          color: FvColors.textview70FontColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: _firstname,
                            style: TextStyle(
                              color: FvColors.textview50FontColor,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 10,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: widthOfScreen * 0.3,
              height: heightOfScreen * 0.035,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(181),
                color: FvColors.offwhitepink,
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add Credit Card",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: FvColors.maintheme,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
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
                  ],
                ),
              ),
            ),
            GestureDetector(
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
            GestureDetector(
              child: FaIcon(
                FontAwesomeIcons.solidBell,
                color: FvColors.maintheme,
              ),
              onTap: () {
                SharedService.logout(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var name = userDetails!.payload!.user!.fullName;
    return name.substring(
      0,
      name.indexOf(' '),
    );
  }
}
