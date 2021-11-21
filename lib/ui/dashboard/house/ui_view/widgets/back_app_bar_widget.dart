import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';

class BackAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String appbarTitle;
  final bool isAddButtonVisible;
  final String addButtonDestination;
  final bool isHomeButtonVisible;
  final bool isSaveButtonVisible;
  final Function onSaveButtonClick;

  BackAppBarWidget(
      this.appbarTitle,
      this.isAddButtonVisible,
      this.addButtonDestination,
      this.isHomeButtonVisible,
      this.isSaveButtonVisible,
      this.onSaveButtonClick,
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
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(appbarTitle, style: HouseTheme.appbarTitle),
              ],
            ),
            const Spacer(),
            Visibility(
              visible: isSaveButtonVisible,
              child: InkWell(
                onTap: onSaveButtonClick(),
                child: const Text("Save", style: HouseTheme.appbarSubtitle),
              ),
            ),
            Visibility(
              visible: isAddButtonVisible,
              child: IconButton(
                color: Colors.white,
                iconSize: 34,
                onPressed: () {
                  print("add Button Clicked");
                  Navigator.of(context).pushNamed("/" + addButtonDestination);
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Constants.white,
                ),
              ),
            ),
            Visibility(
              visible: isHomeButtonVisible,
              child: IconButton(
                color: Colors.white,
                iconSize: 34,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false);
                },
                icon: const Icon(
                  Icons.home,
                  color: Constants.white,
                ),
              ),
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
