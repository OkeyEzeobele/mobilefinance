// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o3_cards/models/profile_image.dart';
import 'package:o3_cards/services/shared_service.dart';
import 'package:o3_cards/ui/pallete.dart';

import '../../../services/api_service.dart';

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
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
    return SizedBox(
      height: heightOfScreen * 0.08,
      child: Column(
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
              FittedBox(
                child: Container(
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
                          "Link Credit Card",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: FvColors.maintheme,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.circlePlus,
                            color: FvColors.maintheme,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FutureBuilder<ProfileImage?>(
                future: imageRoute,
                builder: (context, model) {
                  var response = model.data?.payload;
                  if (model.hasData) {
                    if (model.data!.success) {
                      return GestureDetector(
                        child: Container(
                          width: heightOfScreen * 0.045,
                          height: heightOfScreen * 0.045,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: FvColors.textview79FontColor,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(response!.data!.data),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        // child: CircleAvatar(
                        //   backgroundImage: NetworkImage(response!.data!.data),
                        //   radius: heightOfScreen * 0.02,
                        //   // backgroundColor: FvColors.edittext51Background,
                        //   backgroundColor: Colors.black,
                        // ),
                        onTap: () {
                          // SharedService.logout(context);
                        },
                      );
                    } else {
                      return GestureDetector(
                        child: CircleAvatar(
                          radius: heightOfScreen * 0.02,
                          backgroundColor: FvColors.textview79FontColor,
                          child: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: FvColors.textview50FontColor,
                          ),
                        ),
                        onTap: () {
                          // SharedService.logout(context);
                        },
                      );
                    }
                  } else if (model.hasError) {
                    return GestureDetector(
                      child: CircleAvatar(
                        radius: heightOfScreen * 0.02,
                        backgroundColor: FvColors.textview79FontColor,
                        child: FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: FvColors.textview50FontColor,
                        ),
                      ),
                      onTap: () {
                        // SharedService.logout(context);
                      },
                    );
                  }
                  return GestureDetector(
                    child: CircleAvatar(
                      radius: heightOfScreen * 0.02,
                      backgroundColor: FvColors.textview79FontColor,
                      child: FaIcon(
                        FontAwesomeIcons.solidUser,
                        color: FvColors.textview50FontColor,
                      ),
                    ),
                    onTap: () {
                      // SharedService.logout(context);
                    },
                  );
                },
              ),
              GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: FvColors.maintheme,
                ),
                onTap: () {
                  // SharedService.logout(context);
                },
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
    return name.substring(
      0,
      name.indexOf(' '),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: const Offset(200, 100), radius: 150);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
