// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/pages/moreoptions/change_pin.dart';
import 'package:o3_cards/pages/moreoptions/edit_profile.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constant.dart';
import '../../models/profile_image.dart';
import '../../services/api_service.dart';
import '../../services/shared_service.dart';
import '../../widgets/slider.dart';
import '../dashboard/dashboard.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  late Future<ProfileImage?> imageRoute;

  Future<ProfileImage?> _getImageRoute() async {
    Future<ProfileImage?> model = await SharedService.isProfilePictureSaved()
        ? SharedService.profileImage()
        : APIService.getProfileImage();
    return model;
  }

  @override
  void initState() {
    super.initState();
    imageRoute = _getImageRoute();
    initiate();
  }

  bool isSwitched = isbiometric;
  void initiate() async {
    final prefs = await SharedPreferences.getInstance();

    final bool isActive = prefs.getBool('biometric') ?? false;
    setState(() {
      isbiometric = isActive;
    });
  }

  void savebiometricstatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometric', true);
  }

  void _toggleSwitch(bool value) {
    if (isSwitched == false) {
      isbiometric = true;
      savebiometricstatus();
      setState(() {
        isSwitched = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON and biometric is $isbiometric');
      }
    } else {
      isbiometric = false;
      savebiometricstatus();
      setState(() {
        isSwitched = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF and biometric is $isbiometric');
      }
    }
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
                        page: Dashboard(
                          pageIndex: 2,
                        ),
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
          FutureBuilder<ProfileImage?>(
            future: imageRoute,
            builder: (context, model) {
              var response = model.data?.payload;
              if (model.hasData) {
                if (model.data!.success) {
                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Card(
                        elevation: 15,
                        shape: CircleBorder(),
                        child: Container(
                          width: heightOfScreen * 0.1,
                          height: heightOfScreen * 0.1,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: FvColors.textview79FontColor,
                            // ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(response!.data!.data),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: heightOfScreen * 0.03,
                        width: heightOfScreen * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: FvColors.maintheme,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: FvColors.edittext51Background,
                            size: heightOfScreen * 0.02,
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Card(
                        elevation: 15,
                        shape: CircleBorder(),
                        child: Container(
                          width: heightOfScreen * 0.1,
                          height: heightOfScreen * 0.1,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: FvColors.textview79FontColor,
                            // ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/person.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: heightOfScreen * 0.03,
                        width: heightOfScreen * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: FvColors.maintheme,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: FvColors.edittext51Background,
                            size: heightOfScreen * 0.02,
                          ),
                        ),
                      )
                    ],
                  );
                }
              } else if (model.hasError) {
                return Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Card(
                      elevation: 15,
                      shape: CircleBorder(),
                      child: Container(
                        width: heightOfScreen * 0.1,
                        height: heightOfScreen * 0.1,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: FvColors.textview79FontColor,
                          // ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/person.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: heightOfScreen * 0.03,
                      width: heightOfScreen * 0.03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: FvColors.maintheme,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          color: FvColors.edittext51Background,
                          size: heightOfScreen * 0.02,
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Card(
                      elevation: 15,
                      shape: CircleBorder(),
                      child: Container(
                        width: heightOfScreen * 0.1,
                        height: heightOfScreen * 0.1,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: FvColors.textview79FontColor,
                          // ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/person.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: heightOfScreen * 0.03,
                      width: heightOfScreen * 0.03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: FvColors.maintheme,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          color: FvColors.edittext51Background,
                          size: heightOfScreen * 0.02,
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          ),
          SizedBox(
            height: heightOfScreen * 0.03,
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
                            const snackBar = SnackBar(
                              content: Text(
                                'Not available in beta testing',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              backgroundColor: Colors.red,
                              // shape: StadiumBorder(),
                              dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              elevation: 30,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const Editprofile(),
                            //   ),
                            // );
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
                          onPressed: () {
                            const snackBar = SnackBar(
                              content: Text(
                                'Not available in beta testing',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              backgroundColor: Colors.red,
                              // shape: StadiumBorder(),
                              dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              elevation: 30,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const ChangePin(),
                            //   ),
                            // );
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
                            'Change Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            const snackBar = SnackBar(
                              content: Text(
                                'Not available in beta testing',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              backgroundColor: Colors.red,
                              // shape: StadiumBorder(),
                              dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              elevation: 30,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
                            'Enable Biometric?',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Switch(
                          value: isSwitched,
                          activeColor: FvColors.maintheme,
                          onChanged: _toggleSwitch,
                        ),
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
