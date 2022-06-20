// ignore_for_file: prefer_const_declarations, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/homescreen/widgets/activitiesBody.dart';
import 'package:o3_cards/pages/homescreen/widgets/recentTransactions.dart';
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

    final activitiesBody = Activitiesbody();

    final historyBody = Recenttransactions();

    final userSaveBtn = Container(
      margin: const EdgeInsets.only(top: 0, bottom: 0),
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: heightOfScreen * 0.02,
            width: widthOfScreen * 0.9,
            child: FittedBox(
              child: Row(
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _swapActivities = true;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: widthOfScreen * 0.2,
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
                            fontWeight: FontWeight.w500,
                          ),
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
            ),
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

    var swapTile = Container(
      child: _swapActivities ? activitiesBody : historyBody,
    );

    final body = Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            userSaveBtn,
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: widthOfScreen,
              child: swapTile, //getCustomContainer(),
            ),
          ],
        ),
      ],
    );

    return SizedBox(
      height: heightOfScreen * 0.35,
      child: body, //_isShowingDialog ? bodyWithDialog : bodyWithCharts
    );
  }
}
