import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:o3_cards/pages/cardList/cardlist.dart';
import 'package:o3_cards/pages/homescreen/homescreen.dart';
import 'package:o3_cards/pages/signin/loginscreen.dart';
import 'package:o3_cards/ui/pallete.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.badge(
      const {4: '10+'},
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const TabItem(
          icon: Iconsax.send_21,
          title: 'Send',
        ),
        const TabItem(icon: FontAwesomeIcons.solidCreditCard, title: 'Cards'),
        const TabItem(icon: FontAwesomeIcons.houseUser, title: 'Home'),
        const TabItem(icon: Icons.bar_chart_rounded, title: 'Stats'),
        const TabItem(icon: Iconsax.more, title: 'More'),
      ],
      color: Colors.grey.shade500,
      activeColor: FvColors.maintheme,
      backgroundColor: Colors.white,
      initialActiveIndex: 2, //optional, default as 0
      onTap: (int i) {
        if (i == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Loginscreen()));
        } else if(i == 1){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CardList()));
        } else if ( i == 2){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Homescreen()));
        } else if ( i == 3){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Loginscreen()));
        } else if ( i == 4){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Loginscreen()));
        }
      },
      elevation: 5,
    );
  }
}


// onTap: (int i) => debugPrint('click index=$i'),