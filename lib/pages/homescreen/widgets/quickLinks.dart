// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
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
    debugPrint('Screen Height: $heightOfScreen');
    debugPrint('Screen Width: $widthOfScreen');
    return Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: widthOfScreen * 0.05, top: 0),
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
                              child: const Icon(
                                Iconsax.send_21,
                                color: FvColors.maintheme,
                                size: 24,
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: FvColors.container166Background
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
                          Text(
                            "Send Money",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: widthOfScreen * 0.025,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
                              child: const Icon(
                                Iconsax.wallet_35,
                                color: FvColors.maintheme,
                                size: 24,
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: FvColors.container166Background
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
                          Text(
                            "Pay Bills",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: widthOfScreen * 0.025,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
                              child: const Icon(
                                FontAwesomeIcons.solidCreditCard,
                                color: FvColors.maintheme,
                                size: 24,
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: FvColors.container166Background
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
                          Text(
                            "Fund O3 Card",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: widthOfScreen * 0.025,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
                              child: const FaIcon(
                                FontAwesomeIcons.gift,
                                color: FvColors.maintheme,
                                size: 24,
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: FvColors.container166Background
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
                          Text(
                            "Rewards",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: widthOfScreen * 0.025,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
    ]);
  }
}
