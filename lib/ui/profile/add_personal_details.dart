import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/profile/step.dart';
import 'package:my_planner/util/ui_utils.dart';

class AddPersonalDetails extends StatefulWidget {
  const AddPersonalDetails({Key? key}) : super(key: key);

  @override
  _AddPersonalDetailsState createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  TextEditingController firstNameTextController = TextEditingController();
  late List<bool> isGenderSelected;
  late List<bool> isMaritalStatusSelected;
  late List<bool> isNotificationSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isGenderSelected = [true, false];
    isMaritalStatusSelected = [true, false];
    isNotificationSelected = [true, false];
  }

  @override
  Widget build(BuildContext context) {
    const titleFirstName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "First Name",
          style: HouseTheme.bodyLight,
        ));

    final firstNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: firstNameTextController,
          decoration: const InputDecoration(
            hintText: "Enter first name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleMiddleName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Middle Name",
          style: HouseTheme.bodyLight,
        ));

    final middleNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: firstNameTextController,
          decoration: const InputDecoration(
            hintText: "Enter middle name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleLastName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Last Name",
          style: HouseTheme.bodyLight,
        ));

    final lastNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: firstNameTextController,
          decoration: const InputDecoration(
            hintText: "Enter last name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleMobile = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Mobile No.",
          style: HouseTheme.bodyLight,
        ));

    final mobileFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: firstNameTextController,
          decoration: const InputDecoration(
            hintText: "Enter mobile number here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleGender = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Gender",
          style: HouseTheme.bodyLight,
        ));

    final genderScopeSelector = ToggleButtons(
      borderColor: Constants.white,
      fillColor: Constants.white,
      borderWidth: 1,
      color: Colors.white,
      selectedBorderColor: Colors.white,
      selectedColor: Constants.purpleDark,
      borderRadius: BorderRadius.circular(10),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.male,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Male",
                )
              ],
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.female,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Female",
                )
              ],
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isGenderSelected.length; i++) {
            isGenderSelected[i] = i == index;
          }
        });
      },
      isSelected: isGenderSelected,
    );

    const titleMaritalStatus = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Marital Status",
          style: HouseTheme.bodyLight,
        ));

    final maritalStatusScopeSelector = ToggleButtons(
      borderColor: Constants.white,
      fillColor: Constants.white,
      borderWidth: 1,
      color: Colors.white,
      selectedBorderColor: Colors.white,
      selectedColor: Constants.purpleDark,
      borderRadius: BorderRadius.circular(10),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.person,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Single",
                )
              ],
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.group,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Married",
                )
              ],
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isMaritalStatusSelected.length; i++) {
            isMaritalStatusSelected[i] = i == index;
          }
        });
      },
      isSelected: isMaritalStatusSelected,
    );

    const titleNotification = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Notification",
          style: HouseTheme.bodyLight,
        ));

    final notificationSelector = ToggleButtons(
      borderColor: Constants.white,
      fillColor: Constants.white,
      borderWidth: 1,
      color: Colors.white,
      selectedBorderColor: Colors.white,
      selectedColor: Constants.purpleDark,
      borderRadius: BorderRadius.circular(10),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.notifications,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Enable",
                )
              ],
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.notifications_off,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Disable",
                )
              ],
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isNotificationSelected.length; i++) {
            isNotificationSelected[i] = i == index;
          }
        });
      },
      isSelected: isNotificationSelected,
    );
    return SafeArea(
      child: Scaffold(
        appBar: const StepView([true, true, false, false]),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.kPadding * 2),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: infoCardDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                        radius: 56,
                        backgroundImage:
                            AssetImage("assets/images/userImage.png")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                titleFirstName,
                firstNameFormField,
                const SizedBox(
                  height: 10,
                ),
                titleMiddleName,
                middleNameFormField,
                const SizedBox(
                  height: 10,
                ),
                titleLastName,
                lastNameFormField,
                const SizedBox(
                  height: 10,
                ),
                titleMobile,
                mobileFormField,
                const SizedBox(
                  height: 10,
                ),
                titleGender,
                genderScopeSelector,
                const SizedBox(
                  height: 10,
                ),
                titleMaritalStatus,
                maritalStatusScopeSelector,
                const SizedBox(
                  height: 10,
                ),
                titleNotification,
                notificationSelector,
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        style: secondaryButtonStyle,
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pushNamed("/add_house");
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Save",
                            style: HouseTheme.titleDark,
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
                            style: HouseTheme.titleLight,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
