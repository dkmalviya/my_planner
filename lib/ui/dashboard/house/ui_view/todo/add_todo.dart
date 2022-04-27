import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController eventTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  late List<bool> isPrioritySelected;

  Color priorityColor = Constants.yellow;

  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isPrioritySelected = [true, false, false];
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
    const titleTodo = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Task Title",
          style: HouseTheme.bodyDark,
        ));
    final todoNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: eventTextController,
          decoration: const InputDecoration(
            hintText: "Enter task name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleToDoDate = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Task Date",
          style: HouseTheme.bodyDark,
        ));
    final todoDateFormField = Expanded(
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

    const titlePriority = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Priority",
          style: HouseTheme.bodyDark,
        ));

    final prioritySelector = ToggleButtons(
      borderColor: Constants.purpleDark,
      fillColor: priorityColor,
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      selectedColor: Constants.darkGrey,
      borderRadius: BorderRadius.circular(0),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 3,
            child: const Center(
              child: Text(
                "Low",
              ),
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 3,
            child: const Center(
              child: Text(
                "Medium",
              ),
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 50) / 3,
            child: const Center(
              child: Text(
                "High",
              ),
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isPrioritySelected.length; i++) {
            isPrioritySelected[i] = i == index;
            if (index == 0) {
              priorityColor = Constants.yellow;
            } else if (index == 1) {
              priorityColor = Constants.greenDark;
            } else {
              priorityColor = Constants.redDark;
            }
          }
        });
      },
      isSelected: isPrioritySelected,
    );

    return Scaffold(
      appBar: BackAppBarWidget("Add Task", false, "", true, false, () {},false, () {}),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleTodo,
            todoNameFormField,
            const SizedBox(
              height: 6,
            ),
            titleToDoDate,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                todoDateFormField,
                const SizedBox(
                  width: 10,
                ),
                calenderIcon
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            titlePriority,
            prioritySelector,
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
                      Navigator.of(context).pop();
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
