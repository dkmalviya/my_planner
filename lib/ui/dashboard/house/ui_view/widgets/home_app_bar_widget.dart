import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';

class HomeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String appbarTitle;
  final String calenderTitle;
  final Function onCalenderTap;
  final int notificationCount;

  HomeAppBarWidget(this.appbarTitle, this.calenderTitle, this.onCalenderTap,
      this.notificationCount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        color: Constants.purpleDark,
        child: Row(
          children: [
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(appbarTitle, style: HouseTheme.appbarTitle),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                print("Navigate to Calender");
              },
              child: Text(calenderTitle, style: HouseTheme.appbarSubtitle),
            ),
            Stack(
              children: [
                IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 8,
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
