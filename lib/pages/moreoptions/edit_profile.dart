// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:o3_cards/pages/moreoptions/more.dart';
import 'package:o3_cards/ui/export.dart';

import '../../widgets/slider.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    var _tabTextIndexSelected = 0;
    var _listTextTabToggle = [
      "Profile",
      "Others",
    ];
    var _tabTextIconIndexSelected = 0;

    var _tabSelectedIndexSelected = 0;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                        page: More(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Text(
            'Edit Profile',
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
          // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
          FlutterToggleTab(
            // width in percent
            width: 90,
            borderRadius: 30,
            height: 50,
            selectedIndex: _tabTextIndexSelected,
            selectedBackgroundColors: [FvColors.maintheme, FvColors.maintheme],
            selectedTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            unSelectedTextStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            labels: _listTextTabToggle,
            selectedLabelIndex: (index) {
              setState(() {
                _tabTextIndexSelected = index;
              });
            },
            isScroll: false,
          ),
        ],
      ),
    );
  }
}
