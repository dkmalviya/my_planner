import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/profile/step.dart';
import 'package:my_planner/util/ui_utils.dart';

class AddHouseDetails extends StatefulWidget {
  const AddHouseDetails({Key? key}) : super(key: key);

  @override
  _AddHouseDetailsState createState() => _AddHouseDetailsState();
}

class _AddHouseDetailsState extends State<AddHouseDetails> {
  TextEditingController textEditingControllerHouseNo = TextEditingController();
  TextEditingController textEditingControllerBuildingName =
      TextEditingController();
  TextEditingController textEditingControllerStreet = TextEditingController();
  TextEditingController textEditingControllerArea = TextEditingController();
  TextEditingController textEditingControllerLandmark = TextEditingController();
  TextEditingController textEditingControllerCity = TextEditingController();
  TextEditingController textEditingControllerPin = TextEditingController();
  TextEditingController textEditingControllerHouseName =
      TextEditingController();

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
    const titleHouseName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "House Name",
          style: HouseTheme.bodyLight,
        ));

    final houseNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerHouseName,
          decoration: const InputDecoration(
            hintText: "Enter house name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleHouseNumber = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "House Number",
          style: HouseTheme.bodyLight,
        ));

    final houseNumberFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerHouseNo,
          decoration: const InputDecoration(
            hintText: "Enter house number here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleBuildingName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Building Name",
          style: HouseTheme.bodyLight,
        ));

    final buildingNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerBuildingName,
          decoration: const InputDecoration(
            hintText: "Enter building name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleStreet = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Street",
          style: HouseTheme.bodyLight,
        ));

    final streetFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerStreet,
          decoration: const InputDecoration(
            hintText: "Enter street here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleArea = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Area",
          style: HouseTheme.bodyLight,
        ));

    final areaFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerArea,
          decoration: const InputDecoration(
            hintText: "Enter area here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleLandmark = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Street",
          style: HouseTheme.bodyLight,
        ));

    final landmarkFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerLandmark,
          decoration: const InputDecoration(
            hintText: "Enter landmark here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleCity = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "City",
          style: HouseTheme.bodyLight,
        ));

    final cityFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerCity,
          decoration: const InputDecoration(
            hintText: "Enter city here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titlePinCode = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Pincode",
          style: HouseTheme.bodyLight,
        ));

    final pinCodeFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerPin,
          decoration: const InputDecoration(
            hintText: "Enter pincode here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    return SafeArea(
      child: Scaffold(
        appBar: const StepView([true, true, true, false]),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.kPadding * 2),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: infoCardDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleHouseName,
                houseNameFormField,
                const SizedBox(
                  height: 10,
                ),
                titleHouseNumber,
                houseNumberFormField,
                const SizedBox(
                  height: 10,
                ),
                titleBuildingName,
                buildingNameFormField,
                const SizedBox(
                  height: 10,
                ),
                titleStreet,
                streetFormField,
                const SizedBox(
                  height: 10,
                ),
                titleArea,
                areaFormField,
                const SizedBox(
                  height: 10,
                ),
                titleLandmark,
                landmarkFormField,
                const SizedBox(
                  height: 10,
                ),
                titleCity,
                cityFormField,
                const SizedBox(
                  height: 20,
                ),
                titlePinCode,
                pinCodeFormField,
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
                          Navigator.of(context).pushNamed("/success");
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
