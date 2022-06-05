// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/homescreen/widgets/greeting.dart';
import 'package:o3_cards/pages/homescreen/widgets/quickLinks.dart';
import 'package:o3_cards/ui/export.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        children: [
          Greeting(),
          CreditCards(),
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
