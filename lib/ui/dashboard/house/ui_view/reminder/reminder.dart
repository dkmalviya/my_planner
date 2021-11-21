import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/models/dto/reminder_model.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  static Set<ReminderModel> myReminders = {};
  var currentDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myReminders.clear();

    loadMyReminders();
  }

  loadMyReminders() async {
    for (var testModel in sampleReminder) {
      ReminderModel reminderModelTemp = ReminderModel(
          testModel['id'],
          testModel['name'],
          testModel['occasion'],
          testModel['isNotificationEnable'],
          testModel['occasionDate']);
      setState(() {
        myReminders.add(reminderModelTemp);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget occasionIcon(String occasionName) {
      if (occasionName == occations[0]['occasionName']) {
        return Icon(
          occations[0]['icon'],
          color: Colors.white,
        );
      } else if (occasionName == occations[1]['occasionName']) {
        return Icon(
          occations[1]['icon'],
          color: Colors.white,
        );
      } else if (occasionName == occations[2]['occasionName']) {
        return Icon(
          occations[2]['icon'],
          color: Colors.white,
        );
      } else if (occasionName == occations[3]['occasionName']) {
        return Icon(
          occations[3]['icon'],
          color: Colors.white,
        );
      }
      return const Icon(
        FontAwesomeIcons.heart,
        color: Colors.white,
      );
    }

    return Scaffold(
      appBar: BackAppBarWidget(
          "Reminders", true, "add_reminder", false, false, () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: backgroundCardDecoration,
            child: Container(
              margin: const EdgeInsets.all(14),
              width: MediaQuery.of(context).size.width,
              height: 140,
              decoration: foregroundCardDecoration,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Upcoming Event", //currentDate.toUtc().toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "IST",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                          FontAwesomeIcons.birthdayCake,
                          size: 32,
                          color: Colors.white,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Priya Malviya",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Constants.kPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Center(
                            child: Icon(
                          Icons.access_time,
                          size: 32,
                          color: Colors.white,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "2020-08-26",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ), //End Of Search Box

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
                "Reminders",
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
                itemCount: myReminders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: tileLeadingDecoration,
                        child: Center(
                            child: occasionIcon(
                                sampleReminder[index]['occasion'])),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          myReminders.elementAt(index).name,
                          style: HouseTheme.subTitleDark,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Event : ' +
                                  myReminders.elementAt(index).occasion,
                              style: HouseTheme.bodyDark,
                            ),
                            Text(
                              'Date : ' +
                                  myReminders.elementAt(index).occasionDate,
                              style: HouseTheme.bodyDark,
                            ),
                          ],
                        ),
                      ),
                      trailing: Icon(
                        Icons.delete_forever,
                        size: 32,
                        color: Colors.red[200],
                      ),
                      onTap: () {},
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
