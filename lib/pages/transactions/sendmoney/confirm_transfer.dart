// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/homescreen/widgets/greeting.dart';
import 'package:o3_cards/pages/homescreen/widgets/quick_links.dart';
import 'package:o3_cards/ui/export.dart';

class ConfirmTransfer extends StatefulWidget {
  const ConfirmTransfer({Key? key}) : super(key: key);

  @override
  _ConfirmTransferState createState() => _ConfirmTransferState();
}

class _ConfirmTransferState extends State<ConfirmTransfer> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        children: [
          SizedBox.square(
            dimension: 20,
          ),
          Greeting(),
          SizedBox.square(
            dimension: 20,
          ),
          CreditCards(),
          SizedBox.square(
            dimension: 20,
          ),
          QuickLinks(),
          SizedBox.square(
            dimension: widthOfScreen * 0.07,
          ),
          Activities()
        ],
      ),
    );
  }
}
