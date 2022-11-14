// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/pages/transactions/sendmoney/transfer_to_bank.dart';

import 'package:o3_cards/ui/export.dart';

import '../../../widgets/slider.dart';

class TransferType extends StatefulWidget {
  final String amount;
  const TransferType({Key? key, required this.amount}) : super(key: key);

  @override
  _TransferTypeState createState() => _TransferTypeState();
}

class _TransferTypeState extends State<TransferType> {
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
                        page: Dashboard(pageIndex: 0,),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Text(
            'Select transfer type',
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
                        child: CircleAvatar(
                          backgroundColor: FvColors.offwhitepink,
                          child: FaIcon(
                            FontAwesomeIcons.buildingColumns,
                            color: FvColors.maintheme,
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
                              'Bank Transfer',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Transfer to a bank account',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransfertoBank(
                                amount: widget.amount,
                              ),
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
                          child: Image.asset(
                        "assets/03CapitalLogoSoloIcon1.png",
                      )),
                      SizedBox(
                        width: widthOfScreen * 0.4,
                        // height: heightOfScreen * 0.05,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'O3 Card Transfer',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Transfer to an O3 card',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => TransfertoBank(
                          //       amount: widget.amount,
                          //     ),
                          //   ),
                          // );
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
