// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/ui/export.dart';

class TransferCompleted extends StatefulWidget {
  final String message;
  final String amount;
  final String recepient;
  const TransferCompleted(
      {Key? key,
      required this.message,
      required this.amount,
      required this.recepient})
      : super(key: key);

  @override
  _TransferCompletedState createState() => _TransferCompletedState();
}

class _TransferCompletedState extends State<TransferCompleted> {
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
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.check,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.05,
            ),
            Text('You sent ${NumberFormat.currency(
              name: '₦ ',
              decimalDigits: 0,
            ).format(
              int.parse(widget.amount),
            )} to '),
            Text(
              widget.recepient,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: FvColors.textview50FontColor,
              ),
            ),
            SizedBox(
              height: heightOfScreen*0.06,
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
                      builder: (context) => const Dashboard(pageIndex: 2,),
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
