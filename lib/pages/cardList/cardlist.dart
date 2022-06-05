// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o3_cards/pages/cardList/widgets/bottomModal.dart';
import 'package:o3_cards/ui/export.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: widthOfScreen * 0.05, top: heightOfScreen * 0.05),
                child: SizedBox(
                  width: widthOfScreen * 0.25,
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(children: const <TextSpan>[
                          TextSpan(
                            text: 'Your Cards',
                            style: TextStyle(
                                fontSize: 15,
                                color: FvColors.textview50FontColor,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    minFontSize: 10,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: widthOfScreen * 0.08, top: heightOfScreen * 0.05),
                    child: Container(
                        width: widthOfScreen * 0.34,
                        height: heightOfScreen * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(181),
                          color: FvColors
                              .container58Backgroundcontainer72Backgroundcontainer73Backgroundcontainer141Backgroundcontainer142Backgroundcontainer146Backgroundcontainer147Backgroundcontainer161Backgroundcontainer162Background,
                        ),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: widthOfScreen * 0.02,
                                      top: heightOfScreen * 0.01),
                                  child: Text(
                                    "Request Card",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: widthOfScreen * 0.035,
                                      color: FvColors.maintheme,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                            FittedBox(
                              // height: heightOfScreen * 0.04,
                              // width: widthOfScreen * 0.04,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Loginscreen()));
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: FvColors.maintheme,
                                ),
                              ),
                            ),
                          ],
                        ))),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: heightOfScreen * 0.03),
                      child: Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              child: Image.asset('assets/card_classic.png'),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30))),
                                    builder: (context) {
                                      return (
                                        BottomModal()
                                      );
                                    });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: widthOfScreen * 0.6,
                                  top: heightOfScreen * 0.04),
                              child: Text('Hellooooooo'),
                            )
                          ],
                        ),
                      ),
                    ),
                    width: widthOfScreen * 0.8,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: heightOfScreen * 0.03),
                      child: Center(
                        child: Image.asset('assets/card_prestige.png'),
                      ),
                    ),
                    width: widthOfScreen * 0.8,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: heightOfScreen * 0.03),
                      child: Center(
                        child: Image.asset('assets/card_prestige.png'),
                      ),
                    ),
                    width: widthOfScreen * 0.8,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: heightOfScreen * 0.03),
                      child: Center(
                        child: Image.asset('assets/card_classic.png'),
                      ),
                    ),
                    width: widthOfScreen * 0.8,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: heightOfScreen * 0.03),
                      child: Center(
                        child: Image.asset('assets/card_classic.png'),
                      ),
                    ),
                    width: widthOfScreen * 0.8,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
