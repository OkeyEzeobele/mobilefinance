// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/models/cardlistResponse.dart';
import 'package:o3_cards/pages/cardList/widgets/bottomModal.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/ui/export.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late Future<CardListResponse> userCards;
  @override
  void initState() {
    super.initState();
    userCards = APIService.userCards();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widthOfScreen * 0.25,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Your Cards',
                            style: TextStyle(
                                fontSize: 15,
                                color: FvColors.textview50FontColor,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 10,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: widthOfScreen * 0.4,
                height: heightOfScreen * 0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(181),
                  color: FvColors.offwhitepink,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Request Card",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: FvColors.maintheme,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    FittedBox(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginscreen(),
                            ),
                          );
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.circlePlus,
                          color: FvColors.maintheme,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          FutureBuilder<CardListResponse>(
            future: userCards,
            builder: (context, snapshot) {
              var cards = snapshot.data?.payload;
              if (snapshot.hasData) {
                // return Text('${cards?.length}');
                return Expanded(
                  child: ListView.separated(
                    itemCount: cards!.length,
                    itemBuilder: (context, i) => (cards[i].id != null)
                        ? GestureDetector(
                            child: SizedBox(
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
                                  return (BottomModal());
                                },
                              );
                            },
                          )
                        : Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: heightOfScreen * 0.4),
                              child: Text(
                                'You have no cards yet',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: FvColors.maintheme,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 10,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: heightOfScreen * 0.4),
                    child: Text(
                      'You have no cards yet',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: widthOfScreen * 0.03,
                          color: FvColors.maintheme,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return SizedBox(
                height: heightOfScreen * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widthOfScreen * 0.4,
                      height: heightOfScreen * 0.2,
                      child: FittedBox(
                        
                        child: Image.asset('assets/loadinganimation4.gif'),
                      ),
                    )
                    // const CircularProgressIndicator(
                    //   color: FvColors.maintheme,
                    // ),
                  ],
                ),
              );
            },
          ),
          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: Padding(
          //             padding: EdgeInsets.only(top: heightOfScreen * 0.03),
          //             child: Center(
          //               child: Stack(
          //                 children: [
          //                   GestureDetector(
          //                     child: Image.asset('assets/card_classic.png'),
          //                     onTap: () {
          //                       showModalBottomSheet(
          //                         context: context,
          //                         shape: const RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(30),
          //                             topRight: Radius.circular(30),
          //                           ),
          //                         ),
          //                         builder: (context) {
          //                           return (BottomModal());
          //                         },
          //                       );
          //                     },
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                         left: widthOfScreen * 0.6,
          //                         top: heightOfScreen * 0.04),
          //                     child: Text('Hellooooooo'),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //           width: widthOfScreen * 0.8,
          //         ),
          //         SizedBox(
          //           child: Padding(
          //             padding: EdgeInsets.only(top: heightOfScreen * 0.03),
          //             child: Center(
          //               child: Image.asset('assets/card_prestige.png'),
          //             ),
          //           ),
          //           width: widthOfScreen * 0.8,
          //         ),
          //         SizedBox(
          //           child: Padding(
          //             padding: EdgeInsets.only(top: heightOfScreen * 0.03),
          //             child: Center(
          //               child: Image.asset('assets/card_prestige.png'),
          //             ),
          //           ),
          //           width: widthOfScreen * 0.8,
          //         ),
          //         SizedBox(
          //           child: Padding(
          //             padding: EdgeInsets.only(top: heightOfScreen * 0.03),
          //             child: Center(
          //               child: Image.asset('assets/card_classic.png'),
          //             ),
          //           ),
          //           width: widthOfScreen * 0.8,
          //         ),
          //         SizedBox(
          //           child: Padding(
          //             padding: EdgeInsets.only(top: heightOfScreen * 0.03),
          //             child: Center(
          //               child: Image.asset('assets/card_classic.png'),
          //             ),
          //           ),
          //           width: widthOfScreen * 0.8,
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}