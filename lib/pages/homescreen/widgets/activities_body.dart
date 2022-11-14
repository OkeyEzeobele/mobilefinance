// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/ui/export.dart';

class Activitiesbody extends StatefulWidget {
  const Activitiesbody({Key? key}) : super(key: key);

  @override
  _ActivitiesbodyState createState() => _ActivitiesbodyState();
}

class _ActivitiesbodyState extends State<Activitiesbody> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            shadowColor: Colors.grey.shade50,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: heightOfScreen * 0.11,
              width: widthOfScreen * 0.89,
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
                                color: FvColors.textview50FontColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: '1 out of 2 completed',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.grey,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.grey.shade50,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: heightOfScreen * 0.1,
                  width: widthOfScreen * 0.44,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox.square(
                        dimension: widthOfScreen * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.square(
                            dimension: widthOfScreen * 0.12,
                            child: Image.asset("assets/buyairtimeanddata.png"),
                          )
                        ],
                      ),
                      SizedBox.square(
                        dimension: widthOfScreen * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            // width: widthOfScreen * 0.6,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Buy Airtime\nand data',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: FvColors.textview50FontColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shadowColor: Colors.grey.shade50,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: heightOfScreen * 0.1,
                  width: widthOfScreen * 0.44,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.square(
                            dimension: widthOfScreen * 0.07,
                            child: FittedBox(
                              child: Image.asset("assets/paybillsandfees.png"),
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                      SizedBox.square(
                        dimension: widthOfScreen * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            // width: widthOfScreen * 0.6,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Pay Fees\nand bills',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: FvColors.textview50FontColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                    ],
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
