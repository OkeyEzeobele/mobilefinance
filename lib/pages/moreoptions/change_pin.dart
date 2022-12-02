import 'dart:async';

import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:o3_cards/pages/moreoptions/more.dart';
import 'package:o3_cards/ui/pallete.dart';

import '../../widgets/slider.dart';
// import '/../widgets/dialpad.dart';

class ChangePin extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const ChangePin({Key? key, required this.sessionStateStream}) : super(key: key);

  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  TextEditingController controller = TextEditingController(text: "");
  int pinLength = 4;
  String error = "";
  void remove(dynamic) {
    setState(() {
      if (controller.text.isEmpty) {
        controller.text = "";
      } else {
        controller.text =
            controller.text.substring(0, controller.text.length - 1);
      }
    });
  }

  void addValue(String value) {
    setState(() {
      if (controller.text.isEmpty) {
        controller.text = value;
      } else {
        controller.text += value;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return Scaffold(
      backgroundColor: FvColors.screen5Background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              SlideRightRoute(
                page: More(sessionStateStream: widget.sessionStateStream),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FvColors.maintheme,
          ),
        ),
        backgroundColor: FvColors.screen5Background,
        title: const Text(
          'Enter Old Pin',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: PinAuthentication(
          onChanged: (v) {
            if (kDebugMode) {
              print(v);
            }
          },
          action:'',
          actionDescription: '',
          pinTheme: PinTheme(
            inactiveFillColor: FvColors.maintheme,
            activeFillColor: FvColors.maintheme,
            selectedColor: FvColors.maintheme,
            activeColor: FvColors.maintheme,
            keysColor: FvColors.maintheme,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            selectedFillColor: FvColors.maintheme,
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: heightOfScreen * 0.45,
      //   width: MediaQuery.of(context).size.width,
      //   padding: const EdgeInsets.symmetric(vertical: 25),
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      //     color: Colors.white,
      //   ),
      //   child: Dialpad(
      //     addValue: addValue,
      //     remove: remove,
      //     press: () async {
      //       debugPrint(controller.text);
      //     },
      //   ),
      // ),
    );
  }
}
