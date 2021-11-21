import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/bottom_navigation_view/activity.dart';
import 'package:my_planner/ui/dashboard/house/bottom_navigation_view/add.dart';
import 'package:my_planner/ui/dashboard/house/bottom_navigation_view/analytics.dart';
import 'package:my_planner/ui/dashboard/house/bottom_navigation_view/home.dart';
import 'package:my_planner/ui/dashboard/house/bottom_navigation_view/profile.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/drawer/drawer_page.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/home_app_bar_widget.dart';

class HouseAppHomeScreen extends StatefulWidget {
  const HouseAppHomeScreen({Key? key}) : super(key: key);

  @override
  _HouseAppHomeScreenState createState() => _HouseAppHomeScreenState();
}

class _HouseAppHomeScreenState extends State<HouseAppHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  final List<Widget> _icons = const [
    Icon(
      Icons.home,
      size: 30,
      color: Constants.white,
    ),
    Icon(
      FontAwesomeIcons.chartBar,
      size: 30,
      color: Constants.white,
    ),
    Icon(
      Icons.add,
      size: 30,
      color: Constants.white,
    ),
    Icon(
      Icons.analytics_outlined,
      size: 30,
      color: Constants.white,
    ),
    Icon(
      Icons.person,
      size: 30,
      color: Constants.white,
    ),
  ];

  static const List<Widget> _pages = <Widget>[
    Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          style: TextStyle(fontSize: 50),
          decoration: InputDecoration(
              labelText: 'Find contact',
              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBarWidget("My Planner", "Nov-2021", () {}, 4),
        drawer: const DrawerPage(),
        body: currentIndex == 0
            ? const HomeScreen()
            : currentIndex == 1
                ? const ActivityScreen()
                : currentIndex == 2
                    ? const AddScreen()
                    : currentIndex == 3
                        ? const AnalyticsScreen()
                        : const ProfileScreen(),
        bottomNavigationBar: CurvedNavigationBar(
          index: currentIndex,
          backgroundColor: Colors.transparent,
          items: _icons,
          color: Constants.purpleDark,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
