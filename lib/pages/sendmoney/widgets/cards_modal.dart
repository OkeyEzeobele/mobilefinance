// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../models/cardlistResponse.dart';
import '../../../services/api_service.dart';
import '../../../services/shared_service.dart';

class CardsModal extends StatefulWidget {
  const CardsModal({Key? key}) : super(key: key);

  @override
  _CardsModalState createState() => _CardsModalState();
}

class _CardsModalState extends State<CardsModal> {
  late Future<CardListResponse?> userCards;
  late int cardUsed;
  String cardNum = '';
  Future<CardListResponse?> _getCardsModel() async {
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
    var widthOfScreen = MediaQuery.of(context).size.width;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return SizedBox(
      height: heightOfScreen * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<CardListResponse?>(
            future: userCards,
            builder: ((context, snapshot) {
              return FutureBuilder<CardListResponse?>(
                future: userCards,
                builder: (context, snapshot) {
                  var cards = snapshot.data?.payload;
                  if (snapshot.hasData) {
                    if (snapshot.data!.payload.isEmpty) {
                      return Center(
                        child: Text(
                          'You do not have any cards',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: FvColors.maintheme,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: cards!.length,
                        itemBuilder: (context, i) => GestureDetector(
                          child: SizedBox(
                            height: heightOfScreen * 0.1,
                            width: widthOfScreen,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: heightOfScreen * 0.08,
                                  width: widthOfScreen * 0.8,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: widthOfScreen * 0.1,
                                          height: heightOfScreen * 0.05,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                  (cards[i].first6[0] == '5')
                                                      ? 'assets/vervelogo.png'
                                                      : 'assets/amex.png',
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthOfScreen * 0.05,
                                        ),
                                        SizedBox(
                                          width: widthOfScreen * 0.15,
                                          child: Text(
                                            ('****' + cards[i].last4)
                                                .trimRight(),
                                            style: GoogleFonts.inconsolata(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthOfScreen * 0.3,
                                          child: Text(
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
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              cardUsed = cards[i].id;
                              cardNum =
                                  (cards[i].first6 + 'XXXXXX' + cards[i].last4)
                                      .replaceAllMapped(RegExp(r".{4}"),
                                          (match) => "${match.group(0)} ")
                                      .trimRight();
                            });
                            var cardFinal = [cardUsed, cardNum];
                            Navigator.pop(context, cardFinal);
                          },
                        ),
                        // separatorBuilder: (BuildContext context, int index) =>
                        //     SizedBox(
                        //   height: 1,
                        // ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Failed to load cards',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: widthOfScreen * 0.03,
                            color: FvColors.maintheme,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: heightOfScreen * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.4,
                          height: heightOfScreen * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Loading Cards',
                                style: GoogleFonts.inconsolata(
                                  color: Colors.black,
                                ),
                              ),
                              JumpingDotsProgressIndicator(
                                color: Colors.black,
                                fontSize: 20.0,
                              )
                            ],
                          ),
                        )
                        // const CircularProgressIndicator(
                        //   color: FvColors.maintheme,
                        // ),
                      ],
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
