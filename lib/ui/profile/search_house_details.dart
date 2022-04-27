import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/models/dto/house_model.dart';
import 'package:my_planner/models/request/house/search_house_request_dto.dart';
import 'package:my_planner/models/request/house_member/search_house_member_mobile_request_dto.dart';
import 'package:my_planner/models/response/house/search_house_response_dto.dart';
import 'package:my_planner/models/response/house_member/active_house_member_response_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog_with_two_buttons.dart';
import 'package:my_planner/ui/profile/step.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/widget/progress_loader.dart';

class SearchHouseDetails extends StatefulWidget {
  const SearchHouseDetails({Key? key}) : super(key: key);

  @override
  _SearchHouseDetailsState createState() => _SearchHouseDetailsState();
}

class _SearchHouseDetailsState extends State<SearchHouseDetails> {
  final focus = FocusNode();
  TextEditingController textEditingControllerHouseNo = TextEditingController();
  TextEditingController textEditingControllerHouseMateNumber =
      TextEditingController();
  TextEditingController textEditingControllerSocietyName =
      TextEditingController();
  TextEditingController textEditingControllerPin = TextEditingController();

  List<HouseModel> houseModelList = [];
  bool isNewAddressButtonEnable = false;
  late List<bool> isSearchSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isSearchSelected = [true, false];
    setInitialValues();
  }

  setInitialValues() {
    textEditingControllerHouseNo.text = "A1";
    textEditingControllerSocietyName.text = "Admin";
    textEditingControllerPin.text = "111111";
  }

  @override
  Widget build(BuildContext context) {
    final houseSearchSelector = ToggleButtons(
      borderColor: Constants.purpleDark,
      fillColor: Constants.purpleDark,
      borderWidth: 1,
      color: Constants.purpleDark,
      selectedBorderColor: Constants.purpleDark,
      selectedColor: Constants.white,
      borderRadius: BorderRadius.circular(10),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.location_city,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Address",
                )
              ],
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.group),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Member",
                )
              ],
            )),
      ],
      onPressed: (int index) {
        setState(() {
          houseModelList.clear();
          for (int i = 0; i < isSearchSelected.length; i++) {
            isSearchSelected[i] = i == index;
            isNewAddressButtonEnable = false;
          }
        });
      },
      isSelected: isSearchSelected,
    );

    final houseNumberFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerHouseNo,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: "Enter house number here",
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.home,
              color: Constants.white,
            ),
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    final societyNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerSocietyName,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: "Enter society number here",
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.apartment,
              color: Constants.white,
            ),
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    final pinCodeFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerPin,
          keyboardType: TextInputType.number,

          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),LengthLimitingTextInputFormatter(6)],
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: "Enter pincode here",
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_on,
              color: Constants.white,
            ),
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    final houseMateMobileFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: textEditingControllerHouseMateNumber,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),LengthLimitingTextInputFormatter(10)],
          decoration: const InputDecoration(
            hintText: "Enter housemate mobile here",
            border: InputBorder.none,
            prefixIcon: Icon(
              FontAwesomeIcons.mobileAlt,
              size: 24,
              color: Constants.white,
            ),
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    final searchByAddressView = Container(
      padding: const EdgeInsets.all(12),
      decoration: infoCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          houseNumberFormField,
          const SizedBox(
            height: 10,
          ),
          societyNameFormField,
          const SizedBox(
            height: 10,
          ),
          pinCodeFormField,
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            child: ElevatedButton(
              style: loginButtonStyle,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                searchHouseApiCall();
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Search",
                  style: HouseTheme.titleDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );

    final searchByHouseMate = Container(
      padding: const EdgeInsets.all(12),
      decoration: infoCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          houseMateMobileFormField,
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            child: ElevatedButton(
              style: loginButtonStyle,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                searchHouseByMobileNumberApiCall();
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Search",
                  style: HouseTheme.titleDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );

    final newAddressView = Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(12),
      decoration: infoCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You want to add new Address? Please click on add button!!",
            style: HouseTheme.bodyLight,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            child: ElevatedButton(
              style: loginButtonStyle,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed("/add_house");
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Add",
                  style: HouseTheme.titleDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: const StepView([true, true, true, false]),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.kPadding * 2),
          child: Column(
            children: [
              houseSearchSelector,
              const SizedBox(
                height: 10,
              ),
              Visibility(
                  visible: isSearchSelected[0], child: searchByAddressView),
              Visibility(
                  visible: isSearchSelected[1], child: searchByHouseMate),
              Visibility(
                  visible: isNewAddressButtonEnable, child: newAddressView),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  cacheExtent: 256,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: houseModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: Constants.purpleDark,
                        child: Container(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                  title: Text(
                                    houseModelList
                                            .elementAt(index)
                                            .buildingName +
                                        "-" +
                                        houseModelList
                                            .elementAt(index)
                                            .houseNumber,
                                    style: HouseTheme.appbarTitle,
                                  ),
                                  leading: const Icon(
                                    Icons.home,
                                    color: Constants.white,
                                    size: 30,
                                  ),
                                  horizontalTitleGap: 0,
                                  dense: true,
                                  contentPadding: const EdgeInsets.all(0),
                                  trailing: const Icon(
                                    Icons.add_circle,
                                    color: Constants.yellowDark,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    showAlertAndNavigate(
                                        houseModelList.elementAt(index));
                                  }),
                              const Divider(
                                color: Constants.yellowDark,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 4),
                                child: Text(
                                  houseModelList.elementAt(index).toString(),
                                  style: HouseTheme.bodyLight,
                                ),
                              )
                            ],
                            //subtitle
                          ),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }

  searchHouseByMobileNumberApiCall() async {
    houseModelList.clear();
    setState(() {
      isNewAddressButtonEnable = false;
    });
    SearchHouseMemberByMobileRequestDto searchHouseMemberByMobileRequestDto =
        SearchHouseMemberByMobileRequestDto(
            textEditingControllerHouseMateNumber.text);
    print(searchHouseMemberByMobileRequestDto.toString());
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var searchResponse = await onBoardRepository
          .searchHouseByMemberMobileNumber(searchHouseMemberByMobileRequestDto);

      saveHouseAddress(searchResponse);

      ProgressLoader.hide();
    } catch (e) {
      setState(() {
        isNewAddressButtonEnable = true;
      });
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

  searchHouseApiCall() async {
    houseModelList.clear();
    setState(() {
      isNewAddressButtonEnable = false;
    });
    SearchHouseRequestDto searchHouseRequestDto = SearchHouseRequestDto(
        textEditingControllerSocietyName.text,
        textEditingControllerPin.text,
        textEditingControllerHouseNo.text);

    print(searchHouseRequestDto.toString());
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var list = await onBoardRepository.searchHouse(searchHouseRequestDto);

      if (list.isNotEmpty) {
        saveListInDto(list);
      } else {
        setState(() {
          isNewAddressButtonEnable = true;
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

  void saveHouseAddress(
      ActiveHouseMemberResponseDto activeHouseMemberResponseDto) {
    setState(() {
      var houseModel = HouseModel(
          activeHouseMemberResponseDto.houseResponse.addressId,
          activeHouseMemberResponseDto.houseResponse.area,
          activeHouseMemberResponseDto.houseResponse.buildingName,
          activeHouseMemberResponseDto.houseResponse.city,
          activeHouseMemberResponseDto.houseResponse.houseName,
          activeHouseMemberResponseDto.houseResponse.houseNumber,
          activeHouseMemberResponseDto.houseResponse.landmark,
          activeHouseMemberResponseDto.houseResponse.pinCode,
          "NA",
          activeHouseMemberResponseDto.houseResponse.street);
      houseModelList.add(houseModel);
    });
  }

  void saveListInDto(List<SearchHouseResponseDto> list) {
    for (var tempSearchHouseResponse in list) {
      setState(() {
        var houseModel = HouseModel(
          tempSearchHouseResponse.addressId,
          tempSearchHouseResponse.area,
          tempSearchHouseResponse.buildingName,
          tempSearchHouseResponse.city,
          tempSearchHouseResponse.houseName,
          tempSearchHouseResponse.houseNumber,
          tempSearchHouseResponse.landmark,
          tempSearchHouseResponse.pinCode,
          tempSearchHouseResponse.societyName,
          tempSearchHouseResponse.street,
        );
        houseModelList.add(houseModel);
      });
    }
  }

  void showAlertAndNavigate(HouseModel houseModel) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialogBoxWithMultipleButton(
              "Alert",
              "You want to add " +
                  houseModel.houseNumber +
                  " " +
                  houseModel.buildingName +
                  " ?",
              "Yes",
              "No",
              alertIcon, () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamed("/add_house", arguments: houseModel);
          }, () {
            Navigator.of(context).pop();
          });
        });
  }
}
