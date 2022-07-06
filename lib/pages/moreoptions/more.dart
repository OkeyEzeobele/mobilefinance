// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/pages/moreoptions/editProfile.dart';
import 'package:o3_cards/ui/export.dart';

import '../../services/shared_service.dart';
import '../../widgets/slider.dart';
import '../dashboard/dashboard.dart';
import '../signin/loginscreen2.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  void initState() {
    super.initState();
  }

  String _fullname = '';
  _MoreState() {
    getTextFromFile().then(
      (val) => setState(
        () {
          _fullname = val;
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: widthOfScreen * 0.05,
                  top: heightOfScreen * 0.05,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: FvColors.maintheme,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      SlideRightRoute(
                        page: Dashboard(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Text(
            _fullname,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: FvColors.textview50FontColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: heightOfScreen * 0.05,
          ),
          GestureDetector(
            child: CircleAvatar(
              radius: heightOfScreen * 0.05,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/person.png'),
            ),
          ),
          SizedBox(
            height: heightOfScreen * 0.05,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.grey.shade50,
            color: FvColors.offwhitepink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: heightOfScreen * 0.1,
              width: widthOfScreen * 0.85,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'Verify Your Identity\n',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: FvColors.maintheme,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: '1 out of 2 completed',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                  SizedBox.square(
                    dimension: widthOfScreen * 0.08,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widthOfScreen * 0.21,
                        height: heightOfScreen * 0.1,
                        child: Image.asset("assets/1vrfyidentity.png"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: heightOfScreen * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: heightOfScreen * 0.08,
                width: widthOfScreen * 0.86,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade50,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: heightOfScreen * 0.12,
                    width: widthOfScreen * 0.89,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.6,
                          // height: heightOfScreen * 0.05,
                          child: Text(
                            'Edit Profile Information',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Editprofile(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: FvColors.maintheme,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightOfScreen * 0.08,
                width: widthOfScreen * 0.86,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade50,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: heightOfScreen * 0.12,
                    width: widthOfScreen * 0.89,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.6,
                          // height: heightOfScreen * 0.05,
                          child: Text(
                            'Change Account Pin',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: FvColors.maintheme,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightOfScreen * 0.08,
                width: widthOfScreen * 0.86,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade50,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: heightOfScreen * 0.12,
                    width: widthOfScreen * 0.89,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.6,
                          // height: heightOfScreen * 0.05,
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: FvColors.maintheme,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightOfScreen * 0.08,
                width: widthOfScreen * 0.86,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade50,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: heightOfScreen * 0.12,
                    width: widthOfScreen * 0.89,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.6,
                          // height: heightOfScreen * 0.05,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              builder: (context) {
                                return SizedBox(
                                  height: heightOfScreen * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: widthOfScreen * 0.1),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Logout',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  'Are you sure you want to logout?',
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.04,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.06,
                                        width: widthOfScreen * 0.6,
                                        child: TextButton(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: const Text(
                                              'Log Out',
                                              style: TextStyle(
                                                color: FvColors.offwhite,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor: FvColors.maintheme,
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
                                            SharedService.softlogout(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: FvColors.maintheme,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var name = userDetails!.payload!.user!.fullName;
    return name;
  }
}
