import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 240.0,
              width: double.infinity,
              color: Constants.purpleDark,
            ),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2 - 60.0),
                child: const CircleAvatar(
                    radius: 56,
                    backgroundImage:
                        AssetImage("assets/images/userImage.png"))),
            Positioned(
              top: 160.0,
              left: (MediaQuery.of(context).size.width / 2) - 105.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Deepesh Kumar Malviya',
                    style: TextStyle(
                      // h6 -> title
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 0.18,
                      color: Constants.yellow,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Admin',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          title: Text("User information", style: HouseTheme.title),
        ),
        const Divider(),
        const ListTile(
          title: Text(
            "Email",
            style: HouseTheme.bodyDark,
          ),
          subtitle: Text("deepeshmalviya@outlook.com",
              style: HouseTheme.subTitleDark),
          leading: Icon(
            Icons.email,
            color: Constants.nearlyBlack,
            size: 40,
          ),
        ),
        const ListTile(
          title: Text(
            "Phone",
            style: HouseTheme.bodyDark,
          ),
          subtitle: Text("+91-7774043339", style: HouseTheme.subTitleDark),
          leading: Icon(
            Icons.phone,
            color: Constants.nearlyBlack,
            size: 40,
          ),
        ),
        const ListTile(
          title: Text("Address", style: HouseTheme.bodyDark),
          subtitle: Text("A 305,33 MileStone,Pune 411033 ",
              style: HouseTheme.subTitleDark),
          leading: Icon(
            Icons.location_on,
            color: Constants.nearlyBlack,
            size: 40,
          ),
        ),
        const ListTile(
          title: Text(
            "Joined Date",
            style: HouseTheme.bodyDark,
          ),
          subtitle: Text("14 November 2021", style: HouseTheme.subTitleDark),
          leading: Icon(
            Icons.calendar_view_day,
            color: Constants.nearlyBlack,
            size: 40,
          ),
        ),
      ]),
    );
  }
}
