import 'package:flutter/material.dart';
import 'package:o3_cards/pages/moreoptions/more.dart';
import 'package:o3_cards/ui/pallete.dart';

import '../../widgets/slider.dart';
import '/../widgets/dialpad.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({Key? key}) : super(key: key);

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
        backgroundColor: FvColors.offwhitepink,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                SlideRightRoute(
                  page: const More(),
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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < pinLength; i++)
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(color: FvColors.maintheme),
                    ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: controller.text.length - 1 >= i
                              ? Colors.black
                              : Colors.transparent,
                        ),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: heightOfScreen * 0.45,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            color: Colors.white,
          ),
          child: Dialpad(
            addValue: addValue,
            remove: remove,
            press: () async {
              debugPrint(controller.text);
            },
          ),
        ));
  }
}
