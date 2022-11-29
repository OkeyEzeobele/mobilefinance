// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/ui/export.dart';

class TopupCompleted extends StatefulWidget {
  final String amount;
  final String message;
  final bool success;

  const TopupCompleted({
    Key? key,
    required this.amount,
    required this.success,
    required this.message,
  }) : super(key: key);

  @override
  _TopupCompletedState createState() => _TopupCompletedState();
}

class _TopupCompletedState extends State<TopupCompleted> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widthOfScreen * 0.2,
              height: heightOfScreen * 0.1,
              child: FittedBox(
                child: widget.success
                    ? Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(
                              FontAwesomeIcons.x,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.05,
            ),
            Container(
              child: widget.success
                  ? Text(
                      'Your card has been topped up with ${NumberFormat.currency(
                        name: '₦ ',
                        decimalDigits: 0,
                      ).format(
                        int.parse(widget.amount),
                      )}',
                    )
                  : Text(widget.message),
            ),
            SizedBox(
              height: heightOfScreen * 0.06,
            ),
            SizedBox(
              height: heightOfScreen * 0.05,
              width: widthOfScreen * 0.6,
              child: TextButton(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: const Text(
                    'Home',
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(
                        pageIndex: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
