// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:o3_cards/services/shared_service.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../widgets/slider.dart';
import '../dashboard/dashboard.dart';
import 'application_details.dart';

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
  bool isEmploymentAdded = false;
  bool isPersonalSaved = false;
  bool isStatementSaved = false;
  _CardTypeState() {
    getEmploymentStatus().then(
      (val) => setState(
        () {
          isEmploymentAdded = val;
        },
      ),
    );
    getPersonalDetailStatus().then(
      (val) => setState(
        () {
          isPersonalSaved = val;
        },
      ),
    );
    getStatementStatus().then(
      (val) => setState(
        () {
          isStatementSaved = val;
        },
      ),
    );
  }

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
            'Nurture your family with the O3 prestige card. Its maximum limit of 1,500,000 is perfect for the unexpectedness of everyday domestic life. Anticipate the unexpected and take care of your boisterous, happy family with O3.',
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
                SmoothPageIndicator(
                  controller: _pageController,
                  count: cards.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: FvColors.maintheme,
                    dotHeight: 10,
                    dotWidth: 10,
                    // type: WormType.thin,
                    // strokeWidth: 5,
                  ),
                ),
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
                      } else if (cardType == 'debit') {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          '',
                          'Prepaid card selected',
                          'Ok',
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      } else {
                        Future<void> _showMyDialog() async {
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Employment Status'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        'O3 credit cards are currently available only to salary earners. If you are not a salary earner but you need a credit card, please call our customer care hotline 08126773904 or 08122829445 ',
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('I am a Salary Earner'),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ApplicationDetails(
                                            name: cardName,
                                            type: cardType,
                                            id: productId,
                                            employmentDetailsAdded:
                                                isEmploymentAdded,
                                            statementAdded: isStatementSaved,
                                            personalDetailsAdded:
                                                isPersonalSaved,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }

                        _showMyDialog();
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Future<bool> getEmploymentStatus() async {
    var result = await SharedService.isEmploymentSaved();
    return result;
  }

  Future<bool> getPersonalDetailStatus() async {
    var result = await SharedService.isPersonalSaved();
    return result;
  }

  Future<bool> getStatementStatus() async {
    var result = await SharedService.isPersonalSaved().then((value) async {
      if (value) {
        var status = await SharedService.personalDetails().then((value) {
          if (value!.payload!.statementId!.isEmpty ||
              value.payload!.statementId! == null) {
            return false;
          } else {
            return true;
          }
        });
        return status;
      } else {
        return false;
      }
    });
    return result;
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
