// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/ui/export.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({Key? key}) : super(key: key);

  @override
  _BottomModalState createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return SizedBox(
      height: heightOfScreen * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: heightOfScreen * 0.07,
            width: widthOfScreen * 0.7,
            child: TextButton(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: const Text(
                  'Fund Card',
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
                      BorderRadius.circular(16.31081199645996),
                  side: const BorderSide(
                    width: 1,
                    color: Colors.transparent,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Dashboard(pageIndex: 2,),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: heightOfScreen * 0.07,
            width: widthOfScreen * 0.7,
            child: TextButton(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: const Text(
                  'Delete Card',
                  style: TextStyle(
                    color: FvColors.textview50FontColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: FvColors.textview79FontColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(16.31081199645996),
                  side: const BorderSide(
                    width: 1,
                    color: Colors.transparent,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Dashboard(pageIndex: 2,),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
