// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:o3_cards/pages/creditCardApplication/select_card_type.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/ui/pallete.dart';

class QuickLinks extends StatefulWidget {
  const QuickLinks({Key? key}) : super(key: key);

  @override
  _QuickLinksState createState() => _QuickLinksState();
}

class _QuickLinksState extends State<QuickLinks> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    // debugPrint('Screen Height: $heightOfScreen');
    // debugPrint('Screen Width: $widthOfScreen');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox.square(
                      dimension: widthOfScreen * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: widthOfScreen * 0.13,
                              child: OutlinedButton(
                                child: FittedBox(
                                  child: const Icon(
                                    Iconsax.send_21,
                                    color: FvColors.maintheme,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Dashboard(pageIndex: 0),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox.square(
                              dimension: widthOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.015,
                              child: FittedBox(
                                child: Text(
                                  "Send Money",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: widthOfScreen * 0.13,
                              child: OutlinedButton(
                                child: FittedBox(
                                  child: const Icon(
                                    Icons.wallet,
                                    color: FvColors.maintheme,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox.square(
                              dimension: widthOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.015,
                              child: FittedBox(
                                child: Text(
                                  "Pay Bills",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: widthOfScreen * 0.13,
                              child: OutlinedButton(
                                child: FittedBox(
                                  child: const Icon(
                                    FontAwesomeIcons.solidCreditCard,
                                    color: FvColors.maintheme,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {
                                   Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CardType(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox.square(
                              dimension: widthOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.015,
                              child: FittedBox(
                                child: Text(
                                  "Get an O3 Card",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: widthOfScreen * 0.13,
                              child: OutlinedButton(
                                child: FittedBox(
                                  child: const FaIcon(
                                    FontAwesomeIcons.gift,
                                    color: FvColors.maintheme,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors
                                      .container166Background
                                      .withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: const BorderSide(
                                    //   width: 1,
                                    //   color: Colors.transparent,
                                    // ),
                                  ),
                                ),
                                onPressed: () {
                                 
                                },
                              ),
                            ),
                            SizedBox.square(
                              dimension: widthOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.015,
                              child: FittedBox(
                                child: Text(
                                  "Rewards",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
