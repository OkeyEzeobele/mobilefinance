// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:o3_cards/pages/homescreen/widgets/greeting.dart';
import 'package:o3_cards/pages/homescreen/widgets/quickLinks.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:iconsax/iconsax.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
          // ignore: prefer_const_literals_to_create_immutables
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
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: ConvexAppBar.badge({4: '10+'},
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            TabItem(icon: FontAwesomeIcons.houseUser, title: 'Home'),
            TabItem(icon: FontAwesomeIcons.solidCreditCard, title: 'Cards'),
            TabItem(icon: Iconsax.send_21, title: 'Send'),
            TabItem(icon: Icons.bar_chart_rounded, title: 'Stats'),
            TabItem(icon: Iconsax.more, title: 'More'),
          ],
          color: Colors.grey.shade500,
          activeColor: FvColors.maintheme,
          backgroundColor: Colors.white,
          initialActiveIndex: 2, //optional, default as 0
          onTap: (int i) => debugPrint('click index=$i'),
        ));
  }
}
