import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import '../../services/shared_service.dart';
import '../../ui/export.dart';
import '../signin/loginscreen2.dart';

class Splashscreenscreen1 extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const Splashscreenscreen1({Key? key, required this.sessionStateStream})
      : super(key: key);

  @override
  _Splashscreenscreen1State createState() => _Splashscreenscreen1State();
}

class _Splashscreenscreen1State extends State<Splashscreenscreen1> {
  @override
  void initState() {
    super.initState();
    widget.sessionStateStream.add(SessionState.stopListening);
  }

  bool isLoggedIn = false;
  _Splashscreenscreen1State() {
    _isLoggedIn().then((val) {
      setState(() {
        isLoggedIn = val;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: FvColors.offwhite,
      body: Container(
        width: widthOfScreen,
        height: heightOfScreen,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/splash.gif"), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
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
                          color: FvColors.offwhite,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: FvColors.maintheme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.31081199645996),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onPressed: isLoggedIn
                        ? () {
                          widget.sessionStateStream.add(SessionState.startListening);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen2(
                                    sessionStateStream:
                                        widget.sessionStateStream),
                              ),
                            );
                          }
                        : () {
                          widget.sessionStateStream.add(SessionState.startListening);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Useronboardingscreen2(
                                    sessionStateStream:
                                        widget.sessionStateStream),
                              ),
                            );
                          },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _isLoggedIn() async {
    var result = await SharedService.isLoggedIn();
    return result;
  }
}
