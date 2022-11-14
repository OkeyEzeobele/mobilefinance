// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:o3_cards/pages/cardList/cardlist.dart';
import 'package:o3_cards/pages/transactions/sendmoney/sendmoney.dart';
import 'package:o3_cards/ui/export.dart';

import '../moreoptions/more.dart';

class Dashboard extends StatefulWidget {
  final int pageIndex;
  const Dashboard({Key? key, required this.pageIndex}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Sendmoney(),
    CardList(),
    Homescreen(),
    Text(
      'Coming Soon',
    ),
    More(),
  ];

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const {4: ''},
        disableDefaultTabController: true,
        items: [
          const TabItem(
            icon: Iconsax.send_21,
            title: 'Send',
          ),
          const TabItem(
            icon: FontAwesomeIcons.solidCreditCard,
            title: 'Cards',
          ),
          const TabItem(
            icon: FontAwesomeIcons.houseUser,
            title: 'Home',
          ),
          const TabItem(
            icon: Icons.bar_chart_rounded,
            title: 'Stats',
          ),
          const TabItem(
            icon: Icons.grid_view_rounded,
            title: 'More',
          ),
        ],
        color: Colors.red[200],
        activeColor: FvColors.maintheme,
        backgroundColor: Colors.white,
        initialActiveIndex: 2, //optional, default as 0
        onTap: _onItemTapped,
        elevation: 5,
        style: TabStyle.fixedCircle,
        height: heightOfScreen * 0.06,
        curveSize: 100,
        cornerRadius: 30,
      ),
    );
  }
}
