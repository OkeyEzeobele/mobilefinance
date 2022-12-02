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
  final bool success;
  const TransferCompleted(
      {Key? key,
      required this.message,
      required this.amount,
      required this.recepient,
      required this.success})
      : super(key: key);

  @override
  _TransferCompletedState createState() => _TransferCompletedState();
}

class _TransferCompletedState extends State<TransferCompleted> {
  Widget text() {
    if (widget.success) {
      return Column(
        children: [
          Text(widget.message),
          Text('You sent ${NumberFormat.currency(
            name: '₦ ',
            decimalDigits: 0,
          ).format(
            double.parse(widget.amount),
          )} to '),
          Text(
            widget.recepient,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: FvColors.textview50FontColor,
            ),
          ),
        ],
      );
    } else {
      return Column(children: [
        Text(
          'Transfer Failed',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: FvColors.textview50FontColor,
          ),
        ),
        Text(widget.message),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    Widget statusIcon() {
      if (widget.success) {
        SizedBox(
          width: widthOfScreen * 0.2,
          height: heightOfScreen * 0.1,
          child: FittedBox(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return SizedBox(
        width: widthOfScreen * 0.2,
        height: heightOfScreen * 0.1,
        child: FittedBox(
          child: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  "assets/bottomcurve.png",
                  // height: MediaQuery.of(context).size.height - 170,
                  // width: MediaQuery.of(context).size.width,
                  color: FvColors.maintheme,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightOfScreen * 0.3,
              ),
              statusIcon(),
              SizedBox(
                height: heightOfScreen * 0.05,
              ),
              text(),
              SizedBox(
                height: heightOfScreen * 0.06,
              ),
              Center(
                child: SizedBox(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
