import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/models/dto/house_model.dart';
import 'package:my_planner/models/request/house/create_house_request_dto.dart';
import 'package:my_planner/models/request/house_member/add_house_member_request_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/ui/profile/step.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/validator_service.dart';
import 'package:my_planner/widget/progress_loader.dart';

class AddHouseDetails extends StatefulWidget {
  Object? houseModel;

  AddHouseDetails(this.houseModel, {Key? key}) : super(key: key);

  @override
  _AddHouseDetailsState createState() => _AddHouseDetailsState();
}

class _AddHouseDetailsState extends State<AddHouseDetails> {
  late HouseModel houseModel;
  TextEditingController textEditingControllerHouseNo = TextEditingController();
  TextEditingController textEditingControllerBuildingName =
      TextEditingController();
  TextEditingController textEditingControllerStreet = TextEditingController();
  TextEditingController textEditingControllerArea = TextEditingController();
  TextEditingController textEditingControllerLandmark = TextEditingController();
  TextEditingController textEditingControllerCity = TextEditingController();
  TextEditingController textEditingControllerPin = TextEditingController();
  TextEditingController textEditingControllerSocietyName =
      TextEditingController();
  TextEditingController textEditingControllerHouseName =
      TextEditingController();
  TextEditingController textEditingControllerStartDate =
      TextEditingController();

  TextEditingController textEditingControllerEndDate = TextEditingController();

  late List<bool> isGenderSelected;
  late List<bool> isMaritalStatusSelected;
  late List<bool> isNotificationSelected;
  late bool isAddressFound;
  DateTime currentDate = DateTime.now();
  late DateTime endDate;

  @override
  void initState() {
    isAddressFound = false;

    // TODO: implement initState
    super.initState();
    isGenderSelected = [true, false];
    isMaritalStatusSelected = [true, false];
    isNotificationSelected = [true, false];

    if (widget.houseModel is HouseModel) {
      houseModel = widget.houseModel as HouseModel;
      isAddressFound = true;
      setInitialValues();

      print(houseModel);
    }
  }

  setInitialValues() {
    textEditingControllerPin.text = houseModel.pinCode;
    textEditingControllerHouseNo.text = houseModel.houseNumber;
    textEditingControllerLandmark.text = houseModel.landmark;
    textEditingControllerCity.text = houseModel.city;
    textEditingControllerArea.text = houseModel.area;
    textEditingControllerBuildingName.text = houseModel.buildingName;
    textEditingControllerStreet.text = houseModel.street;
    textEditingControllerHouseName.text = houseModel.houseName;
    textEditingControllerSocietyName.text = houseModel.societyName;
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
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
        initialDate: (controller == textEditingControllerStartDate)
            ? currentDate
            : endDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(pickedDate);

        if (controller == textEditingControllerStartDate) {
          endDate = pickedDate.add(const Duration(days: 364));
          textEditingControllerEndDate.text = formatter.format(endDate);
        }

        controller.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          textInputAction: TextInputAction.next,
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
          textInputAction: TextInputAction.next,
          controller: textEditingControllerBuildingName,
          decoration: const InputDecoration(
            hintText: "Enter building name here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleSocietyName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Society Name",
          style: HouseTheme.bodyLight,
        ));

    final societyNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          style: HouseTheme.bodyLight,
          controller: textEditingControllerSocietyName,
          decoration: const InputDecoration(
            hintText: "Enter society or building  name here",
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
          textInputAction: TextInputAction.next,
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
          textInputAction: TextInputAction.next,
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
          textInputAction: TextInputAction.next,
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
          textInputAction: TextInputAction.next,
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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            LengthLimitingTextInputFormatter(6)
          ],
          textInputAction: TextInputAction.done,
          style: HouseTheme.bodyLight,
          controller: textEditingControllerPin,
          decoration: const InputDecoration(
            hintText: "Enter pincode here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    // Personalize Content

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

    const titleStartDate = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Start Date",
          style: HouseTheme.bodyLight,
        ));

    final startDateTextFormField = Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 5, 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          readOnly: true,
          style: HouseTheme.bodyLight,
          controller: textEditingControllerStartDate,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: InputBorder.none,
              hintStyle: HouseTheme.bodyLight,
              suffixIcon: IconButton(
                  onPressed: () =>
                      _selectDate(context, textEditingControllerStartDate),
                  icon: const Icon(
                    FontAwesomeIcons.calendarAlt,
                    color: Constants.white,
                  ))),
        ));

    const titleEndDate = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "End Date",
          style: HouseTheme.bodyLight,
        ));

    final endDateTextFormField = Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 5, 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          readOnly: true,
          style: HouseTheme.bodyLight,
          controller: textEditingControllerEndDate,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: InputBorder.none,
              hintStyle: HouseTheme.bodyLight,
              suffixIcon: IconButton(
                  onPressed: () => {
                        if (textEditingControllerStartDate.text != "")
                          {
                            _selectDate(context, textEditingControllerEndDate),
                          }
                        else
                          {Fluttertoast.showToast(msg: msgInvalidStartDate)}
                      },
                  icon: const Icon(
                    FontAwesomeIcons.calendarAlt,
                    color: Constants.white,
                  ))),
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
                titleSocietyName,
                societyNameFormField,
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
                titleStartDate,
                startDateTextFormField,
                const SizedBox(
                  height: 20,
                ),
                titleEndDate,
                endDateTextFormField,
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
                          var isValidForm = validateHouseForm();

                          if(isValidForm){
                            if(isAddressFound){
                              addHouseMemberApiCall(houseModel.addressId);
                            }
                            else{
                              addHouseAddressApiCall();
                            }
                          }
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

  addHouseAddressApiCall() async {
    CreateHouseRequestDto createHouseRequest = CreateHouseRequestDto(
        textEditingControllerArea.text,
        textEditingControllerBuildingName.text,
        textEditingControllerHouseName.text,
        textEditingControllerHouseNo.text,
        textEditingControllerLandmark.text,
        textEditingControllerPin.text,
        textEditingControllerStreet.text,
        textEditingControllerSocietyName.text,
        textEditingControllerCity.text);
    print(createHouseRequest.toString());
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var response =
          await onBoardRepository.addHouseAddress(createHouseRequest);

      addHouseMemberApiCall(response.addressId);

      ProgressLoader.hide();
    } catch (e) {
      ProgressLoader.hide();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox("Failed", e.toString(), "OK", alertIcon, () {
              Navigator.of(context).pop();
            });
          });
    }
  }

  addHouseMemberApiCall(int addressId) async {
    AddHouseMemberRequestDto addHouseMemberRequestDto =
        AddHouseMemberRequestDto(addressId,textEditingControllerStartDate.text,textEditingControllerEndDate.text);

    print(addHouseMemberRequestDto.toString());
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var genericResponse =
          await onBoardRepository.addHouseMember(addHouseMemberRequestDto);

      if (genericResponse.responseCode == 0) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                  "Success", genericResponse.message, "OK", successIcon, () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/success");
              });
            });
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                  "Failed", genericResponse.message, "OK", alertIcon, () {
                Navigator.of(context).pop();
              });
            });
      }

      ProgressLoader.hide();
    } catch (e) {
      ProgressLoader.hide();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox("Failed", e.toString(), "OK", alertIcon, () {
              Navigator.of(context).pop();
            });
          });
    }
  }

  bool validateHouseForm() {
    if (isNotEmptyField(textEditingControllerHouseNo.text) &&
        isValidLength(textEditingControllerHouseNo.text, 3)) {
      if (isNotEmptyField(textEditingControllerBuildingName.text) &&
          isValidLength(textEditingControllerBuildingName.text, 3)) {
        if (isNotEmptyField(textEditingControllerSocietyName.text) &&
            isValidLength(textEditingControllerSocietyName.text, 3)) {
          if (isNotEmptyField(textEditingControllerStreet.text) &&
              isValidLength(textEditingControllerStreet.text, 3)) {
            if (isNotEmptyField(textEditingControllerArea.text) &&
                isValidLength(textEditingControllerArea.text, 3)) {
              if (isNotEmptyField(textEditingControllerLandmark.text) &&
                  isValidLength(textEditingControllerLandmark.text, 3)) {
                if (isNotEmptyField(textEditingControllerCity.text) &&
                    isValidLength(textEditingControllerCity.text, 3)) {
                  if (isNotEmptyField(textEditingControllerPin.text) &&
                      isValidLength(textEditingControllerPin.text, 6)) {
                    if (isNotEmptyField(textEditingControllerHouseName.text) &&
                        isValidLength(textEditingControllerPin.text, 3)) {
                      if (isNotEmptyField(
                          textEditingControllerStartDate.text)) {
                        if (isNotEmptyField(
                            textEditingControllerEndDate.text)) {
                          return true;


                          //todo
                        } else {
                          Fluttertoast.showToast(msg: msgInvalidEndDate);
                        }
                      } else {
                        Fluttertoast.showToast(msg: msgInvalidStartDate);
                      }
                    } else {
                      Fluttertoast.showToast(msg: msgInvalidHouseName);
                    }
                  } else {
                    Fluttertoast.showToast(msg: msgInvalidPin);
                  }
                } else {
                  Fluttertoast.showToast(msg: msgInvalidCity);
                }
              } else {
                Fluttertoast.showToast(msg: msgInvalidHouseLandmark);
              }
            } else {
              Fluttertoast.showToast(msg: msgInvalidArea);
            }
          } else {
            Fluttertoast.showToast(msg: msgInvalidStreet);
          }
        } else {
          Fluttertoast.showToast(msg: msgInvalidSociety);
        }
      } else {
        Fluttertoast.showToast(msg: msgInvalidBuilding);
      }
    } else {
      Fluttertoast.showToast(msg: msgInvalidHouseNumber);
    }

    return false;
  }
}
