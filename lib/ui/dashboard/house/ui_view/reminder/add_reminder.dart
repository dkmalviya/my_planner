import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final List<String> _eventType = [
    "Wedding",
    "Birthday",
    "Work",
    "Anniversary",
    "Inauguration",
    "Moment",
  ];

  TextEditingController eventTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  late List<bool> isOccuranceSelected;

  late String selectedEventType = _eventType.first;
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isOccuranceSelected = [true, false, false, false];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Constants.purpleDark, // header background color
                onPrimary: Constants.white, // header text color
                onSurface: Constants.nearlyBlack, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(pickedDate);
        dateTextController.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const titleEventType = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Event Type",
          style: HouseTheme.bodyDark,
        ));
    final eventTypeSelector = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          value: selectedEventType,
          dropdownColor: Constants.purpleDark,
          underline: const SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Constants.white,
          ),
          iconSize: 24,
          style: HouseTheme.bodyLight,
          onChanged: (String? newValue) {
            setState(() {
              selectedEventType = newValue!;
            });
          },
          isExpanded: true,
          items: _eventType.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: HouseTheme.bodyLight,
              ),
            );
          }).toList(),
        ));

    const titleEventName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Event Name",
          style: HouseTheme.bodyDark,
        ));
    final eventNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: eventTextController,
          decoration: const InputDecoration(
            hintText: "Enter event name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleEventDate = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Event Name",
          style: HouseTheme.bodyDark,
        ));
    final eventDateFormField = Expanded(
        flex: 9,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
                color: Constants.purpleDark,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              readOnly: true,
              style: HouseTheme.bodyLight,
              controller: dateTextController,
              enabled: false,
              decoration: const InputDecoration(
                hintText: "DD/MM/YYYY",
                border: InputBorder.none,
                hintStyle: HouseTheme.bodyLight,
              ),
            )));

    final calenderIcon = Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          decoration: BoxDecoration(
              color: Constants.purpleDark,
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(
                FontAwesomeIcons.calendarAlt,
                color: Constants.white,
              )),
        ));

    const titleReminderOccurrence = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Reminder Occurrence",
          style: HouseTheme.bodyDark,
        ));

    final occurrenceSelector = ToggleButtons(
      borderColor: Constants.purpleDark,
      fillColor: Constants.purpleDark,
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      selectedColor: Constants.white,
      borderRadius: BorderRadius.circular(0),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 4,
            child: const Center(
              child: Text(
                "Single",
              ),
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 4,
            child: const Center(
              child: Text(
                "Weekly",
              ),
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 4,
            child: const Center(
              child: Text(
                "Monthly",
              ),
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 4,
            child: const Center(
              child: Text(
                "Yearly",
              ),
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isOccuranceSelected.length; i++) {
            isOccuranceSelected[i] = i == index;
          }
        });
      },
      isSelected: isOccuranceSelected,
    );

    return Scaffold(
      appBar: BackAppBarWidget("Add Reminder", false, "", true, false, () {}),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleEventType,
            eventTypeSelector,
            const SizedBox(
              height: 6,
            ),
            titleEventName,
            eventNameFormField,
            const SizedBox(
              height: 6,
            ),
            titleEventDate,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                eventDateFormField,
                const SizedBox(
                  width: 10,
                ),
                calenderIcon
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            titleReminderOccurrence,
            occurrenceSelector,
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
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
