// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mono_flutter/mono_flutter.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../widgets/slider.dart';
import '../dashboard/dashboard.dart';

class CardType extends StatefulWidget {
  const CardType({Key? key}) : super(key: key);

  @override
  _CardTypeState createState() => _CardTypeState();
}

class _CardTypeState extends State<CardType> {
  bool isAPIcallProcess = false;
  String monoKey = dotenv.env['MONO_KEY']!;
  @override
  void initState() {
    super.initState();
  }

  String cardName = '';
  String cardType = '';
  int? productId;


  @override
  Widget build(BuildContext context) {
    List<Cards> cards = [
      Cards(
        productName: "Classic Card",
        productCode: 100,
        productType: 'credit',
        productDescription:
            'This card of convenience is perfect for lower income households who are just beginning to build a line of credit. Join THE O3 WORLD with our CLASSIC credit card. You can upgrade or increase your limit when you are ready.',
      ),
      Cards(
        productName: "Platinum Card",
        productCode: 105,
        productType: 'credit',
        productDescription:
            'Level up with our O3 Platinum card. Like the precious metal it’s made from, the O3 platinum card is perfect for a working professional on the go with little precious moments to spare. Discover a new level of financial freedom with the maximum limit of 1,000,000 that the O3 platinum card allows. Join THE O3 WORLD with our platinum verve card. You can upgrade or increase your limit when you are ready.',
      ),
      Cards(
        productName: "Prestige Card",
        productCode: 110,
        productType: 'credit',
        productDescription:
            'Nurture your family with the O3 prestige card. Its maximum limit of 1,500,000 is perfect for the unexpectedness of everyday domestic life. Anticipate the unexpected and take care of your boisterous, happy family with O3. Join THE O3 WORLD with our platinum verve card. You can upgrade or increase your limit when you are ready.',
      ),
      Cards(
        productName: "Prepaid Card",
        productCode: 101,
        productType: 'debit',
        productDescription:
            'Are you a student or someone on a strict budget? The O3 prepaid card might just be for you. A prepaid card is much like a gift card: It allows you to spend whatever amount of money is stored on the card. Once the balance is used up, you can reload the card right here on the app!',
      )
    ];
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    final _currentPageNotifier = ValueNotifier<int>(0);
    _buildCircleIndicator() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: cards.length,
          currentPageNotifier: _currentPageNotifier,
          dotColor: Colors.grey,
          selectedDotColor: FvColors.maintheme,
        ),
      );
    }

    final _pageController = PageController(
      viewportFraction: 0.9,
    );
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: isAPIcallProcess
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: widthOfScreen * 0.4,
                    height: heightOfScreen * 0.2,
                    child: FittedBox(
                      child: Image.asset('assets/loadinganimation4.gif'),
                    ),
                  ),
                )
                // const CircularProgressIndicator(
                //   color: FvColors.maintheme,
                // ),
              ],
            )
          : Column(
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
                                pageIndex: 2,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Select Card type',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: FvColors.textview50FontColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heightOfScreen * 0.05,
                ),
                SizedBox(
                  height: heightOfScreen * 0.63,
                  width: widthOfScreen * 0.8,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: cards.length,
                    onPageChanged: (int i) {
                      _currentPageNotifier.value = i;
                    },
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      String _setImage() {
                        if (cards[i].productName == 'Classic Card') {
                          return 'assets/classic_card_Ptr.jpg';
                        } else if (cards[i].productName == 'Platinum Card') {
                          return 'assets/cardimgplatinum_ptr.png';
                        } else if (cards[i].productName == 'Prestige Card') {
                          return 'assets/card_prestige_ptr.png';
                        }
                        return 'assets/cardimgprepaid_ptr.png';
                      }

                      _setIcon() {
                        if (cards[i].productCode == productId) {
                          return Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: FvColors.offwhite,
                                size: 10,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.transparent,
                                size: 10,
                              ),
                            ),
                          );
                        }
                      }

                      return GestureDetector(
                        child: Column(
                          children: [
                            SizedBox(
                              height: heightOfScreen * 0.55,
                              width: widthOfScreen * 0.8,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(_setImage()),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _setIcon(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.03,
                            ),
                            Text(
                              cards[i].productName,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: FvColors.textview50FontColor,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            builder: (context) {
                              var data = cards[i];
                              return SizedBox(
                                height: heightOfScreen * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      width: widthOfScreen * 0.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.productName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color:
                                                  FvColors.textview50FontColor,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(
                                            height: heightOfScreen * 0.02,
                                          ),
                                          Text(
                                            data.productDescription,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  FvColors.textview50FontColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightOfScreen * 0.05,
                                      width: widthOfScreen * 0.5,
                                      child: TextButton(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: const Text(
                                            'Select this Card ',
                                            style: TextStyle(
                                              color: FvColors.offwhite,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: FvColors.maintheme,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                16.31081199645996),
                                            side: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            cardName = data.productName;
                                            cardType = data.productType;
                                            productId = data.productCode;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                _buildCircleIndicator(),
                SizedBox(
                  height: heightOfScreen * 0.05,
                ),
                SizedBox(
                  height: heightOfScreen * 0.06,
                  width: widthOfScreen * 0.6,
                  child: TextButton(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: const Text(
                        'Continue',
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
                      if (cardName.isEmpty) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          '',
                          'No card selected. Please click on a card to select it',
                          'Ok',
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            content: SizedBox(
                              width: widthOfScreen * 0.9,
                              height: heightOfScreen * 0.7,
                              child: MonoWebView(
                                apiKey: monoKey,
                              ),
                            ),
                          );
                          // return Center(
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.rectangle,
                          //       borderRadius: BorderRadius.all(Radius.circular(15))
                          //     ),
                          //     width: widthOfScreen * 0.9,
                          //     height: heightOfScreen * 0.7,
                          //     child: MonoWebView(
                          //       apiKey: 'test_pk_SoMIoNARpHQREPCGlzv2',
                          //     ),
                          //   ),
                          // );
                        },
                      );
                      // MonoFlutter().launch(
                      //   context,
                      //   'test_pk_SoMIoNARpHQREPCGlzv2',
                      //   reference:
                      //       DateTime.now().millisecondsSinceEpoch.toString(),
                      //   // config: {
                      //   //   "selectedInstitution": {
                      //   //     "id": "5f2d08bf60b92e2888287703",
                      //   //     "auth_method": "internet_banking"
                      //   //   }
                      //   // },
                      //   // onEvent: (event, data) {
                      //   //   if (kDebugMode) print('event: $event, data: $data');
                      //   // },
                      //   // onClosed: () {
                      //   //   if (kDebugMode) print('Modal closed');
                      //   // },
                      //   // onLoad: () {
                      //   //   setState(() {
                      //   //     isAPIcallProcess = false;
                      //   //   });
                      //   //   if (kDebugMode) print('Mono loaded successfully');
                      //   // },
                      //   onSuccess: (code) {
                      //     if (kDebugMode) print('Mono Success $code');
                      //   },
                      // );

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Useronboardingscreen2(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class Cards {
  String productName;
  int productCode;
  String productType;
  String productDescription;

  Cards({
    required this.productName,
    required this.productCode,
    required this.productType,
    required this.productDescription,
  });
}
