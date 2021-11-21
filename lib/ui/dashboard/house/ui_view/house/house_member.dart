import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/models/house_member_model.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';

class HouseMemberScreen extends StatefulWidget {
  const HouseMemberScreen({Key? key}) : super(key: key);

  @override
  _HouseMemberScreenState createState() => _HouseMemberScreenState();
}

class _HouseMemberScreenState extends State<HouseMemberScreen> {
  static Set<HouseMemberModel> myHouseMembers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myHouseMembers.clear();

    loadMyHouseMembers();
  }

  loadMyHouseMembers() {
    for (var testModel in sampleMembers) {
      HouseMemberModel houseMemberModelTemp = HouseMemberModel(
        testModel['memberId'],
        testModel['houseMemberName'],
        testModel['age'],
        testModel['gender'],
        testModel['memberType'],
        testModel['relation'],
        testModel['profilePictureUrl'],
        testModel['isActive'],
        testModel['mobile'],
        testModel['email'],
        testModel['createdOn'],
      );
      setState(() {
        myHouseMembers.add(houseMemberModelTemp);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBarWidget(
          "House Member", true, "add_house_member", false, false, () {}),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: Constants.kPadding),
          decoration: backgroundCardDecoration,
          child: Container(
            margin: const EdgeInsets.all(14),
            width: MediaQuery.of(context).size.width,
            decoration: foregroundCardDecoration,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "House Address", //currentDate.toUtc().toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Tenants",
                        style: HouseTheme.bodyLight,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Constants.kPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Center(
                          child: Icon(
                        FontAwesomeIcons.houseUser,
                        size: 26,
                        color: Colors.white,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                            "A-305, 33 Milestone, Mumbai pune Highway, Tathawade, Behind Indira college, Pune - 411033 ",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: HouseTheme.titleLight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const ListTile(
          leading: Icon(
            FontAwesomeIcons.solidBell,
            color: Constants.purpleMedium,
          ),
          title: Align(
            alignment: Alignment(-1.2, 0),
            child: Text(
              "House Member List :",
              style: HouseTheme.subTitleDark,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              cacheExtent: 256,
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: Constants.kPadding),
              itemCount: myHouseMembers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(Constants.kPadding),
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  width: MediaQuery.of(context).size.width,
                  decoration: foregroundCardDecoration,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                              radius: 36,
                              backgroundImage:
                                  AssetImage("assets/images/userImage.png")),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myHouseMembers.elementAt(index).houseMemberName,
                                style: HouseTheme.subTitleLight,
                              ),
                              Text(
                                "Age : " +
                                    myHouseMembers
                                        .elementAt(index)
                                        .age
                                        .toString(),
                                style: HouseTheme.bodyLight,
                              ),
                              Text(
                                "Role : " +
                                    myHouseMembers.elementAt(index).memberType,
                                style: HouseTheme.bodyLight,
                              ),
                              Text(
                                myHouseMembers.elementAt(index).isActive
                                    ? "Status : Yes"
                                    : "User Status : No",
                                style: HouseTheme.bodyLight,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        color: Constants.white,
                        height: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Constants.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              myHouseMembers.elementAt(index).email,
                              style: HouseTheme.appbarSubtitle,
                            ),
                          ]),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.call,
                              color: Constants.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              myHouseMembers.elementAt(index).mobile,
                              style: HouseTheme.appbarSubtitle,
                            ),
                          ]),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(
                        color: Constants.white,
                        height: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                          "Created On : " +
                              myHouseMembers.elementAt(index).createdOn,
                          style: HouseTheme.caption,
                        ),
                      ])
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}
