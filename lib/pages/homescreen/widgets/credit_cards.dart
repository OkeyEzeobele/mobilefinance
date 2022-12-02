// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables,, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:o3_cards/ui/pallete.dart';
// import 'package:page_view_indicators/circle_page_indicator.dart';
// import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../models/cardlist.dart';
import '../../../services/api_service.dart';
import '../../../services/shared_service.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({Key? key}) : super(key: key);

  @override
  _CreditCardsState createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  late Future<CardListResponse?> userCards;

  Future<CardListResponse?> _getCardsModel() async {
    Future<CardListResponse?> model = APIService.userCards();
    // Future<CardListResponse?> model = await SharedService.isCardsSaved()
    //     ? SharedService.cardDetails()
    //     : APIService.userCards();
    return model;
  }
  Future<CardListResponse?> _getSavedCards()async{
    Future<CardListResponse?> model = await SharedService.isCardsSaved()
        ? SharedService.cardDetails()
        : APIService.userCards();
    return model;
  }

  @override
  void initState() {
    super.initState();
    userCards = _getCardsModel();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    // var widthOfScreen = MediaQuery.of(context).size.width;
    return FutureBuilder<CardListResponse?>(
      future: userCards,
      builder: (context, cardModel) {
        var cards = cardModel.data?.payload;
        if (cardModel.hasData) {
          final _currentPageNotifier = ValueNotifier<int>(0);
          final _pageController = PageController(
            viewportFraction: 0.8,
          );
          if (cardModel.data!.payload.isEmpty) {
            return SizedBox(
              height: 216,
              width: 450,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/cardplaceholder.png'),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Click to request for a card',
                      style: GoogleFonts.inconsolata(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Column(
            children: [
              SizedBox(
                height: 216,
                width: 450,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: cards!.length,
                      onPageChanged: (int i) {
                        _currentPageNotifier.value = i;
                      },
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        String _setImage() {
                          if (cards[i].type == 'prepaid') {
                            return 'assets/cardimgprepaid.png';
                          } else if (cards[i]
                              .orderLabel
                              .toString()
                              .contains('Platinum')) {
                            return 'assets/cardimgplatinum.png';
                          }
                          return 'assets/cardimgbusinesscredit.png';
                        }

                        return Column(
                          children: [
                            SizedBox(
                              height: 216,
                              width: 450,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(_setImage()),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 40,
                                        ),
                                        child: Text(
                                          // 'N'+ cards![i].balance,
                                          cards[i].balance == '0.0' ||
                                                  cards[i]
                                                      .balance
                                                      .toString()
                                                      .contains('-')
                                              ? '₦ ' +
                                                  cards[i].balance.toString()
                                              : NumberFormat.currency(
                                                  name: '₦ ',
                                                  decimalDigits: 2,
                                                ).format(cards[i].balance),
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.inconsolata(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      (cards[i].first6 +
                                              'XXXXXX' +
                                              cards[i].last4)
                                          .replaceAllMapped(RegExp(r".{4}"),
                                              (match) => "${match.group(0)} ")
                                          .trimRight(),
                                      style: GoogleFonts.inconsolata(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                            text: 'Exp: ',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: DateFormat.yM().format(
                                                  (DateTime.parse(
                                                    cards[i].createdAt,
                                                  ).add(
                                                    Duration(days: 730),
                                                  )),
                                                ),
                                                style: GoogleFonts.inconsolata(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'CIF Number: ',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: cards[i].cifNumber,
                                                style: GoogleFonts.inconsolata(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightOfScreen * 0.008,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: cards.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: FvColors.maintheme,
                  dotHeight: 5,
                  dotWidth: 10,
                  // type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
            ],
          );
        } else if (cardModel.hasError) {
          return SizedBox(
            height: 216,
            width: 450,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/cardplaceholder.png'),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Failed to load cards',
                    style: GoogleFonts.inconsolata(
                      // fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return SizedBox(
          height: 200,
          width: 420,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: SizedBox(
                height: 200,
                width: 320,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          // child: Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.contain,
          //       image: AssetImage('assets/cardplaceholder.png'),
          //     ),
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //   padding: EdgeInsets.all(20),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             'Loading Cards',
          //             style: GoogleFonts.inconsolata(
          //               fontSize: 20.0,
          //               color: Colors.white,
          //             ),
          //           ),
          //           JumpingDotsProgressIndicator(
          //             color: Colors.white,
          //             fontSize: 20.0,
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
