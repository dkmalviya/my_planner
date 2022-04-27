import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/models/dto/income_category_model.dart';
import 'package:my_planner/models/request/income/add_income_request_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/validator_service.dart';
import 'package:my_planner/widget/progress_loader.dart';

class AddIncomeScreen extends StatefulWidget {
  final List<IncomeCategoryModel> incomeCategoryList;

  const AddIncomeScreen(this.incomeCategoryList, {Key? key}) : super(key: key);

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  DateTime currentDate = DateTime.now();

  late List<bool> isHouseIncome;

  final List<String> _incomeModes = [
    "Online",
    "Bank Transfer",
    "Cash",
    "G-Pay",
    "Others"
  ];

  TextEditingController categoryTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  TextEditingController creditDateTextController = TextEditingController();

  late IncomeCategoryModel selectedIncomeSource =
      widget.incomeCategoryList.first;

  late String selectedIncomeMode = _incomeModes.first;

  @override
  void initState() {
    // TODO: implement initState
    //  Future.delayed(Duration.zero, getAllIncomeCategory);
    super.initState();
    isHouseIncome = [true, false];
    setDefaultDate();
    /*Future.delayed(Duration.zero, () {
      ();
    });*/
  }

  setDefaultDate(){
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(currentDate);
    creditDateTextController.text = formatted;
  }

  Future<void> _selectDate(
      BuildContext context) async {
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
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(pickedDate);
        creditDateTextController.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const titleIncomeType = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Income Type",
          style: HouseTheme.bodyDark,
        ));
    final incomeSourceSelector = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<IncomeCategoryModel>(
          value: selectedIncomeSource,
          dropdownColor: Constants.purpleDark,
          underline: const SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Constants.white,
          ),
          iconSize: 24,
          style: HouseTheme.bodyLight,
          onChanged: (IncomeCategoryModel? newValue) {
            setState(() {
              selectedIncomeSource = newValue!;
            });
          },
          isExpanded: true,
          items: widget.incomeCategoryList
              .map<DropdownMenuItem<IncomeCategoryModel>>(
                  (IncomeCategoryModel value) {
            return DropdownMenuItem<IncomeCategoryModel>(
              value: value,
              child: Text(
                value.incomeSourceName,
                style: HouseTheme.bodyLight,
              ),
            );
          }).toList(),
        ));

    const titleIncomeMode = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Income Mode",
          style: HouseTheme.bodyDark,
        ));

    final incomeModeSelector = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          value: selectedIncomeMode,
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
              selectedIncomeMode = newValue!;
            });
          },
          isExpanded: true,
          items: _incomeModes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: HouseTheme.bodyLight,
              ),
            );
          }).toList(),
        ));

    const titleIncomeAmount = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Amount",
          style: HouseTheme.bodyDark,
        ));
    final amountFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            LengthLimitingTextInputFormatter(10)
          ],
          textInputAction: TextInputAction.next,
          controller: amountTextController,
          decoration: const InputDecoration(
            hintText: "Enter Amount",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleCreditDate = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Credit Date",
          style: HouseTheme.bodyDark,
        ));
    final creditDateTextFormField = Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 5, 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          readOnly: true,
          style: HouseTheme.bodyLight,
          controller: creditDateTextController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: InputBorder.none,
              hintStyle: HouseTheme.bodyLight,
              suffixIcon: IconButton(
                  onPressed: () =>
                      _selectDate(context),
                  icon: const Icon(
                    FontAwesomeIcons.calendarAlt,
                    color: Constants.white,
                  ))),
        ));

    const titleHouseIncome = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Income Type",
          style: HouseTheme.bodyDark,
        ));
    final houseIncomeSelector = ToggleButtons(
      borderColor: Constants.purpleDark,
      fillColor: Constants.purpleDark,
      borderWidth: 1,
      color: Constants.purpleDark,
      selectedBorderColor: Constants.purpleDark,
      selectedColor: Constants.white,
      borderRadius: BorderRadius.circular(10),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery.of(context).size.width - 20) / 2,
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
                  "Personal",
                )
              ],
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 68) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.house,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "House",
                )
              ],
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isHouseIncome.length; i++) {
            isHouseIncome[i] = i == index;
            //       isHouseIncomeSelected = genderValueList[index];
          }
        });
      },
      isSelected: isHouseIncome,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleIncomeType,
          incomeSourceSelector,
          const SizedBox(
            height: 6,
          ),
          titleIncomeMode,
          incomeModeSelector,
          const SizedBox(
            height: 6,
          ),
          titleIncomeAmount,
          amountFormField,
          const SizedBox(
            height: 6,
          ),
          titleCreditDate,
          creditDateTextFormField,
          const SizedBox(
            height: 6,
          ),
          titleHouseIncome,
          houseIncomeSelector,
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  style: primaryButtonStyle,
                  onPressed: () async {
                    if (isValidIncomeForm()) {
                      addIncome();
                    }
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
                    clearFields();
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
    );
  }

  addIncome() async {
    try {
      ProgressLoader.show(context);
      final amount = double.parse(amountTextController.text);
      AddIncomeRequestDto addIncomeRequestDto = AddIncomeRequestDto(
          amount,
          creditDateTextController.text,
          selectedIncomeSource.incomeSourceId,
          selectedIncomeSource.incomeSourceName,
          true,
          selectedIncomeMode,
          "Not Available");
      var onBoardRepository = OnBoardRepository();

      var incomeResponse =
          await onBoardRepository.addIncome(addIncomeRequestDto);

      print(incomeResponse);



      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
                "Success", "Income added successfully", "OK", successIcon, () {
              clearFields();
              Navigator.of(context).pop();
            });
          });

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

  void clearFields() {
    setState(() {

      selectedIncomeSource = widget.incomeCategoryList.first;
      selectedIncomeMode = _incomeModes.first;
      isHouseIncome = [true, false];
      setDefaultDate();
    });

    amountTextController.text = "";

  }

  bool isValidIncomeForm() {
    if (isNotEmptyField(amountTextController.text) &&
        double.parse(amountTextController.text) != 0) {
      return true;
    } else {
      Fluttertoast.showToast(msg: msgInvalidAmount);
    }
    return false;
  }

/*
  void saveIncomeCategory(List<IncomeSourceResponseDto> list) {
    setState(() {
    for (var tempIncomeResponse in list) {

        var incomeSource = IncomeCategoryModel(
            tempIncomeResponse.incomeSourceId,
            tempIncomeResponse.incomeSourceName
        );
        incomeCategoryList.add(incomeSource);


    }

      selectedIncomeSource= incomeCategoryList.first;
    });

  }*/
}
