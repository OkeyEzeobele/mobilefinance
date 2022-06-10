// ignore_for_file: prefer_const_declarations, file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:o3_cards/ui/export.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  bool _swapActivities = true;
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

    final activitiesBody = Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthOfScreen * 0.05, top: heightOfScreen * 0.01),
            child: Card(
              elevation: 5,
              shadowColor: Colors.grey.shade50,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: heightOfScreen * 0.11,
                width: widthOfScreen * 0.89,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox.square(
                      dimension: widthOfScreen * 0.08,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          // width: widthOfScreen * 0.6,
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Verify Your Identity\n',
                                style: GoogleFonts.lato(
                                  // ignore: prefer_const_constructors
                                  textStyle: TextStyle(
                                      fontSize: widthOfScreen * 0.045,
                                      color: FvColors.textview50FontColor,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              TextSpan(
                                text: '1 Verification Completed out of 2',
                                style: GoogleFonts.lato(
                                  // ignore: prefer_const_constructors
                                  textStyle: TextStyle(
                                      fontSize: widthOfScreen * 0.03,
                                      color: FvColors.textview50FontColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox.square(
                      dimension: widthOfScreen * 0.08,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.21,
                          height: heightOfScreen * 0.1,
                          child: Image.asset("assets/1vrfyidentity.png"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
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
                    height: heightOfScreen * 0.1,
                    width: widthOfScreen * 0.43,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox.square(
                          dimension: widthOfScreen * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: widthOfScreen * 0.12,
                              child:
                                  Image.asset("assets/buyairtimeanddata.png"),
                            )
                          ],
                        ),
                        SizedBox.square(
                          dimension: widthOfScreen * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              // width: widthOfScreen * 0.6,
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: 'Buy Airtime\nand data',
                                    style: GoogleFonts.lato(
                                      // ignore: prefer_const_constructors
                                      textStyle: TextStyle(
                                          fontSize: widthOfScreen * 0.03,
                                          color: FvColors.textview50FontColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Card(
                elevation: 5,
                shadowColor: Colors.grey.shade50,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: heightOfScreen * 0.1,
                  width: widthOfScreen * 0.44,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox.square(
                        dimension: widthOfScreen * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.square(
                            dimension: widthOfScreen * 0.12,
                            child: Image.asset("assets/paybillsandfees.png"),
                          )
                        ],
                      ),
                      SizedBox.square(
                        dimension: widthOfScreen * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            // width: widthOfScreen * 0.6,
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Pay Fees\nand bills',
                                  style: GoogleFonts.lato(
                                    // ignore: prefer_const_constructors
                                    textStyle: TextStyle(
                                        fontSize: widthOfScreen * 0.03,
                                        color: FvColors.textview50FontColor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final historyBody = Center(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
              left: widthOfScreen * 0.05, top: heightOfScreen * 0.01),
          child: const Text('No Transactions Yet'),
        ),
      ),
    );

    final userSaveBtn = Container(
      margin: const EdgeInsets.only(top: 0, bottom: 0),
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    child: Text(
                      'Activities',
                      style: TextStyle(
                          color: _swapActivities
                              ? FvColors.maintheme
                              : FvColors.textview70FontColor,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      setState(() {
                        _swapActivities = true;
                      });
                    },
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    child: Text(
                      'History',
                      style: TextStyle(
                          color: !_swapActivities
                              ? FvColors.maintheme
                              : FvColors.textview70FontColor,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      setState(() {
                        _swapActivities = false;
                      });
                    },
                  )
                ],
              )
            ],
          ),
          SizedBox.square(
            dimension: heightOfScreen * 0.01,
          ),
          ToggleSwitch(
            cornerRadius: 10,
            minWidth: widthOfScreen * 0.6,
            minHeight: heightOfScreen * 0.004,
            // fontSize: 12.0,
            initialLabelIndex: _swapActivities ? 0 : 1,
            activeBgColor: const [
              FvColors.maintheme,
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: FvColors.offwhitepink,
            inactiveFgColor: Colors.black,
            labels: const ['', ''],
            onToggle: (index) {
              setState(() {
                _swapActivities = !_swapActivities;
              });
            },
          ),
        ],
      ),
    );

    // ignore: unnecessary_new
    var swapTile = new Container(
      child: _swapActivities ? activitiesBody : historyBody,
    );

    final body = Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            userSaveBtn,
            SizedBox(
              width: widthOfScreen,
              child: swapTile, //getCustomContainer(),
            ),
          ],
        ),
      ],
    );

    return Container(
      child: body, //_isShowingDialog ? bodyWithDialog : bodyWithCharts
    );
  }
}
