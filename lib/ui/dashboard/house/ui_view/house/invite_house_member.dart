import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';

class InviteHouseMember extends StatefulWidget {
  const InviteHouseMember({Key? key}) : super(key: key);

  @override
  _InviteHouseMemberState createState() => _InviteHouseMemberState();
}

class _InviteHouseMemberState extends State<InviteHouseMember> {
  TextEditingController emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const titleEmailName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Email",
          style: HouseTheme.bodyDark,
        ));
    final emailFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: emailTextController,
          decoration: const InputDecoration(
            hintText: "Enter email here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));
    return Scaffold(
      appBar: BackAppBarWidget("Invite Member", false, "", true, false, () {},false, () {}),
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width,
                        decoration: foregroundCardDecoration,
                        child: Row(
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
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    emailFormField,
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: primaryButtonStyle,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: clearButtonStyle,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]))),
    );
  }
}
