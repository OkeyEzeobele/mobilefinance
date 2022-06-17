// ignore_for_file: file_names, prefer_const_constructors,prefer_const_literals_to_create_immutables,, unnecessary_null_comparison

// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../../../models/cardlistResponse.dart';
import '../../../services/api_service.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({Key? key}) : super(key: key);

  @override
  _CreditCardsState createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  late Future<CardListResponse> userCards;
  @override
  void initState() {
    super.initState();
    userCards = APIService.userCards();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FutureBuilder<CardListResponse>(
          future: userCards,
          builder: (context, cardModel) {
            var cards = cardModel.data?.payload;
            if (cardModel.hasData) {
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
              return SizedBox(
                height: 216,
                width: 450,
                child: PageView.builder(
                  controller: PageController(
                    viewportFraction: 0.8,
                  ),
                  itemCount: cards!.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 216,
                          width: 450,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  (cards[i].orderLabel == 'Prestige Card')
                                      ? 'assets/card_prestige.png'
                                      : 'assets/card_classic.png',
                                ),
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
                                          ? '₦ ' + cards[i].balance.toString()
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
                                  (cards[i].first6 + 'XXXXXX' + cards[i].last4)
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    );
                  },
                ),
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
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Loading Cards',
                          style: GoogleFonts.inconsolata(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        JumpingDotsProgressIndicator(
                          color: Colors.white,
                          fontSize: 20.0,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
