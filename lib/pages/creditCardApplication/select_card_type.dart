// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../widgets/slider.dart';
import '../dashboard/dashboard.dart';

class CardType extends StatefulWidget {
  const CardType({Key? key}) : super(key: key);

  @override
  _CardTypeState createState() => _CardTypeState();
}

class _CardTypeState extends State<CardType> {
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
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet massa vitae tortor condimentum lacinia quis vel. Nisi scelerisque eu ultrices vitae auctor eu augue.',
      ),
      Cards(
        productName: "Prestige Card",
        productCode: 110,
        productType: 'credit',
        productDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet massa vitae tortor condimentum lacinia quis vel. Nisi scelerisque eu ultrices vitae auctor eu augue.',
      ),
      Cards(
        productName: "Platinum Card",
        productCode: 105,
        productType: 'credit',
        productDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet massa vitae tortor condimentum lacinia quis vel. Nisi scelerisque eu ultrices vitae auctor eu augue.',
      ),
      Cards(
        productName: "Prepaid Card",
        productCode: 101,
        productType: 'debit',
        productDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet massa vitae tortor condimentum lacinia quis vel. Nisi scelerisque eu ultrices vitae auctor eu augue.',
      )
    ];
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    final _currentPageNotifier = ValueNotifier<int>(0);
    _buildCircleIndicator() {
      return Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CirclePageIndicator(
            itemCount: cards.length,
            currentPageNotifier: _currentPageNotifier,
            dotColor: Colors.grey,
            selectedDotColor: FvColors.maintheme,
          ),
        ),
      );
    }

    final _pageController = PageController(
      viewportFraction: 0.9,
    );
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
                    return Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                    );
                  } else {
                    return Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green.withOpacity(0),
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
                        return (SizedBox(
                          height: heightOfScreen * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: widthOfScreen * 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cards[i].productName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: FvColors.textview50FontColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: heightOfScreen * 0.02,
                                    ),
                                    Text(
                                      cards[i].productDescription,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: FvColors.textview50FontColor,
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
                                      cardName = cards[i].productName;
                                      cardType = cards[i].productType;
                                      productId = cards[i].productCode;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ));
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
