import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/models/dto/expense_category_model.dart';
import 'package:my_planner/models/dto/expense_sub_category_model.dart';
import 'package:my_planner/models/request/expense/add_expense_request_dto.dart';
import 'package:my_planner/models/response/expense/expense_category_response_dto.dart';
import 'package:my_planner/models/response/expense/expense_sub_category_response_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/validator_service.dart';
import 'package:my_planner/widget/progress_loader.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  DateTime currentDate = DateTime.now();

  final List<String> _expenseModes = [
    "Online",
    "Bank Transfer",
    "Cash",
    "G-Pay",
    "Others"
  ];

  late List<bool> isScopeSelected;
  late List<bool> isTypeSelected;

  TextEditingController categoryTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  TextEditingController expenseDateTextController = TextEditingController();
  TextEditingController expenseNameTextController = TextEditingController();
  TextEditingController paymentModeTextController = TextEditingController();

  List<ExpenseCategoryModel> expenseCategoryList = [
    ExpenseCategoryModel(0, "Please Select Expense Category")
  ];
  List<ExpenseSubCategoryModel> expenseSubCategoryList = [
    ExpenseSubCategoryModel(0, "Please Select Expense Subcategory")
  ];

  late ExpenseCategoryModel selectedExpenseCategory;
  late ExpenseSubCategoryModel selectedExpenseSubCategory;
  late String selectedExpenseMode = _expenseModes.first;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedExpenseCategory = expenseCategoryList.first;
    selectedExpenseSubCategory = expenseSubCategoryList.first;

    setDefaultDate();

    Future.delayed(Duration.zero, getAllExpenseCategory);

    isScopeSelected = [true, false];
    isTypeSelected = [true, false];
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
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(pickedDate);
        expenseDateTextController.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const titleExpenseCategory = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Expense Category",
          style: HouseTheme.bodyDark,
        ));

    final expenseCategorySelector = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<ExpenseCategoryModel>(
          value: selectedExpenseCategory,
          dropdownColor: Constants.purpleDark,
          underline: const SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Constants.white,
          ),
          iconSize: 24,
          style: HouseTheme.bodyLight,
          onChanged: (ExpenseCategoryModel? newValue) {
            setState(() {
              selectedExpenseCategory = newValue!;
              if (isValidExpenseCategory()) {
                getAllExpenseSubCategory();
              }
            });
          },
          isExpanded: true,
          items: expenseCategoryList
              .map<DropdownMenuItem<ExpenseCategoryModel>>(
                  (ExpenseCategoryModel value) {
                return DropdownMenuItem<ExpenseCategoryModel>(
                  value: value,
                  child: Text(
                    value.expenseCategoryName,
                    style: HouseTheme.bodyLight,
                  ),
                );
              }).toList(),
        ));

    const titleExpenseMode = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Payment Mode",
          style: HouseTheme.bodyDark,
        ));

    final expenseModeSelector = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          value: selectedExpenseMode,
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
              selectedExpenseMode = newValue!;
            });
          },
          isExpanded: true,
          items: _expenseModes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: HouseTheme.bodyLight,
              ),
            );
          }).toList(),
        ));

    const titleExpenseSubCategory = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Expense Sub Category",
          style: HouseTheme.bodyDark,
        ));

    final expenseSubCategorySelector = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<ExpenseSubCategoryModel>(
          value: selectedExpenseSubCategory,
          dropdownColor: Constants.purpleDark,
          underline: const SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Constants.white,
          ),
          iconSize: 24,
          style: HouseTheme.bodyLight,
          onChanged: (ExpenseSubCategoryModel? newValue) {
            setState(() {
              selectedExpenseSubCategory = newValue!;
              if (isValidExpenseSubCategory()) {
                setState(() {
                  expenseNameTextController.text =
                      selectedExpenseSubCategory.expenseSubCategoryName +
                          " - " +
                          selectedExpenseCategory.expenseCategoryName;

                });
                  }
            });
          },
          isExpanded: true,
          items: expenseSubCategoryList
              .map<DropdownMenuItem<ExpenseSubCategoryModel>>(
                  (ExpenseSubCategoryModel value) {
                return DropdownMenuItem<ExpenseSubCategoryModel>(
                  value: value,
                  child: Text(
                    value.expenseSubCategoryName,
                    style: HouseTheme.bodyLight,
                  ),
                );
              }).toList(),
        ));

    const titleExpenseName = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Expense Name",
          style: HouseTheme.bodyDark,
        ));

    final expenseNameFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: expenseNameTextController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(30)
          ],
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            hintText: "Enter Expense Name",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleAmount = Padding(
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
          controller: amountTextController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            LengthLimitingTextInputFormatter(10)
          ],
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            hintText: "Enter Amount",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

    const titleExpenseType = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Expense Type",
          style: HouseTheme.bodyDark,
        ));

    final expenseTypeSelector = ToggleButtons(
      borderColor: Constants.purpleDark,
      fillColor: Constants.purpleDark,
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      selectedColor: Constants.white,
      borderRadius: BorderRadius.circular(0),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery
                .of(context)
                .size
                .width - 48) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.credit_card,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Expense",
                )
              ],
            )),
        SizedBox(
            width: (MediaQuery
                .of(context)
                .size
                .width - 48) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.savings,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Saving",
                )
              ],
            )),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isTypeSelected.length; i++) {
            isTypeSelected[i] = i == index;
          }
        });
      },
      isSelected: isTypeSelected,
    );

    const titleExpenseScope = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Expense Scope",
          style: HouseTheme.bodyDark,
        ));

    final expenseScopeSelector = ToggleButtons(
      borderColor: Constants.purpleDark,
      fillColor: Constants.purpleDark,
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      selectedColor: Constants.white,
      borderRadius: BorderRadius.circular(0),
      children: <Widget>[
        SizedBox(
            width: (MediaQuery
                .of(context)
                .size
                .width - 48) / 2,
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
            width: (MediaQuery
                .of(context)
                .size
                .width - 48) / 2,
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
          for (int i = 0; i < isScopeSelected.length; i++) {
            isScopeSelected[i] = i == index;
          }
        });
      },
      isSelected: isScopeSelected,
    );

    const titleExpenseDate = Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(
          "Expense Date",
          style: HouseTheme.bodyDark,
        ));
    final expenseDateTextFormField = Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 5, 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          readOnly: true,
          style: HouseTheme.bodyLight,
          controller: expenseDateTextController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: InputBorder.none,
              hintStyle: HouseTheme.bodyLight,
              suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(
                    FontAwesomeIcons.calendarAlt,
                    color: Constants.white,
                  ))),
        ));

    return Scaffold(
      appBar: BackAppBarWidget("Add Expense", false, "", true, false, () {},false, () {}),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleExpenseScope,
            expenseScopeSelector,
            const SizedBox(
              height: 6,
            ),
            titleExpenseType,
            expenseTypeSelector,
            const SizedBox(
              height: 6,
            ),
            titleExpenseCategory,
            expenseCategorySelector,
            const SizedBox(
              height: 6,
            ),
            titleExpenseSubCategory,
            expenseSubCategorySelector,
            const SizedBox(
              height: 6,
            ),
            titleExpenseMode,
            expenseModeSelector,
            const SizedBox(
              height: 6,
            ),
            titleExpenseName,
            expenseNameFormField,
            const SizedBox(
              height: 6,
            ),
            titleAmount,
            amountFormField,
            const SizedBox(
              height: 6,
            ),
            titleExpenseDate,
            expenseDateTextFormField,
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

                      if (isValidIncomeForm()) {
                        addExpenseApiCall();
                      }
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

  setDefaultDate(){
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(currentDate);
    expenseDateTextController.text = formatted;
  }

  getAllExpenseCategory() async {
//    expenseCategoryList.clear();

    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var expenseCategoryResponse =
      await onBoardRepository.getAllExpenseCategory();

      print(expenseCategoryResponse);

      saveExpenseCategory(expenseCategoryResponse);

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

  void saveExpenseCategory(List<ExpenseCategoryResponseDto> list) {
    setState(() {
      for (var tempExpenseResponse in list) {
        var expenseCategory = ExpenseCategoryModel(
            tempExpenseResponse.expenseCategoryId,
            tempExpenseResponse.expenseCategoryName);
        expenseCategoryList.add(expenseCategory);
      }

      //  selectedIncomeSource= incomeCategoryList.first;
    });
  }

  getAllExpenseSubCategory() async {
    reInitializeSubCategoryList();
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var expenseSubCategoryResponse = await onBoardRepository
          .getAllExpenseSubCategory(selectedExpenseCategory.expenseCategoryId);

      print(expenseSubCategoryResponse);

      saveExpenseSubCategory(expenseSubCategoryResponse);

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

  void saveExpenseSubCategory(
      ExpenseSubCategoryResponseDto expenseSubCategoryResponseDto) {
    setState(() {
      for (var tempExpenseResponse
      in expenseSubCategoryResponseDto.expenseSubCategoryDtoList) {
        var expenseSubCategory = ExpenseSubCategoryModel(
            tempExpenseResponse.expenseSubCategoryId,
            tempExpenseResponse.expenseSubCategoryName);
        expenseSubCategoryList.add(expenseSubCategory);

        print("length" + expenseSubCategoryList.length.toString());
        print("response" + expenseSubCategoryList.toString());
      }

      //  selectedIncomeSource= incomeCategoryList.first;
    });
  }

  addExpenseApiCall() async {
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();
      double amount = double.parse(amountTextController.text);
      var expenseType = "";
      if (isTypeSelected[0]) {
        expenseType = "Expense";
      }
      else {
        expenseType = "Saving";
      }

      bool isHouseExpense =false;


      if (isScopeSelected[0]) {
        isHouseExpense = false;
      }
      else {
        isHouseExpense = true;
      }
      AddExpenseRequestDto addExpenseRequestDto = AddExpenseRequestDto(
          amount,
         expenseDateTextController.text,
          selectedExpenseSubCategory.expenseSubCategoryId,
          isHouseExpense,
          "Not Available",
          expenseType,
          expenseNameTextController.text,
          selectedExpenseMode,
          "Not Available");



      var addExpenseResponse = await onBoardRepository
          .addExpense(addExpenseRequestDto);

      print(addExpenseResponse);



      ProgressLoader.hide();
      showSuccessDialog();
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


  bool isValidExpenseCategory() {
    if (selectedExpenseCategory.expenseCategoryId == 0) {
      reInitializeSubCategoryList();
      return false;
    } else {
      return true;
    }
  }

  bool isValidExpenseSubCategory() {
    if (selectedExpenseSubCategory.expenseSubCategoryId == 0) {
      return false;
    } else {
      return true;
    }
  }

  reInitializeSubCategoryList() {
    setState(() {
      expenseSubCategoryList.removeRange(1, expenseSubCategoryList.length);
      selectedExpenseSubCategory = expenseSubCategoryList.first;
    });
  }

  bool isValidIncomeForm() {
    if (isValidExpenseCategory()) {
      if (isValidExpenseSubCategory()) {
        if (isNotEmptyField(expenseNameTextController.text)) {
          if ((isNotEmptyField(amountTextController.text) &&
              double.parse(amountTextController.text) != 0)) {
            if (isNotEmptyField(expenseDateTextController.text)) {
              return true;
            } else {
              Fluttertoast.showToast(msg: msgInvalidDate);
            }
          } else {
            Fluttertoast.showToast(msg: msgInvalidAmount);
          }
        } else {
          Fluttertoast.showToast(msg: msgInvalidExpenseName);
        }
      } else {
        Fluttertoast.showToast(msg: msgInvalidExpenseSubCategory);
      }
    } else {
      Fluttertoast.showToast(msg: msgInvalidExpenseCategory);
    }
    return false;
  }

  void showSuccessDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialogBox("Success", "Expense added successfully", "OK", successIcon, () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        });
  }

}
