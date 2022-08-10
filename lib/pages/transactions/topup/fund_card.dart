// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/pages/transactions/topup/amount_foreign.dart';
import 'package:o3_cards/pages/transactions/topup/amount_naira.dart';

import 'package:o3_cards/ui/export.dart';

import '../../../widgets/slider.dart';

class FundCard extends StatefulWidget {
  final int id;
  const FundCard({Key? key, required this.id}) : super(key: key);

  @override
  _FundCardState createState() => _FundCardState();
}

class _FundCardState extends State<FundCard> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
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
                          pageIndex: 1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Text(
            'Fund Card',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: FvColors.textview50FontColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: heightOfScreen * 0.2,
          ),
          SizedBox(
            height: heightOfScreen * 0.15,
            width: widthOfScreen * 0.9,
            child: FittedBox(
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
                        height: heightOfScreen * 0.08,
                        width: widthOfScreen * 0.15,
                        child: CircleAvatar(
                          backgroundColor: FvColors.offwhitepink,
                          child: Text(
                            '₦',
                            style: GoogleFonts.dancingScript(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: FvColors.maintheme,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widthOfScreen * 0.4,
                        // height: heightOfScreen * 0.05,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fund with Naira',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AmountNaira(id: widget.id,),
                            ),
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
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: heightOfScreen * 0.15,
            width: widthOfScreen * 0.9,
            child: FittedBox(
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
                        height: heightOfScreen * 0.08,
                        width: widthOfScreen * 0.15,
                        child: CircleAvatar(
                            backgroundColor: FvColors.offwhitepink,
                            child: Text(
                              '£\$',
                              style: GoogleFonts.dancingScript(
                                textStyle: TextStyle(
                                  color: FvColors.maintheme,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: widthOfScreen * 0.4,
                        // height: heightOfScreen * 0.05,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fund with Foreign Currency',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AmountForeign(id: widget.id,),
                            ),
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
          ),
        ],
      ),
    );
  }
}
