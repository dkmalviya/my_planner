import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/models/fav_expense_category_model.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/util/house_db.dart';
import 'package:my_planner/util/ui_utils.dart';

class AddExpenseFromFavoriteScreen extends StatefulWidget {
  const AddExpenseFromFavoriteScreen({Key? key}) : super(key: key);

  @override
  _AddExpenseFromFavoriteScreenState createState() =>
      _AddExpenseFromFavoriteScreenState();
}

class _AddExpenseFromFavoriteScreenState
    extends State<AddExpenseFromFavoriteScreen> {
  final List<String> _expenseModes = [
    "Online",
    "Bank Transfer",
    "Cash",
    "G-Pay",
    "Others"
  ];

  List<FavoriteExpenseCategoryModel> myFavoriteExpenses = [];
  HouseDB houseDB = HouseDB();

  late List<bool> isScopeSelected;
  late List<bool> isTypeSelected;

  TextEditingController categoryTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();

  late FavoriteExpenseCategoryModel selectedExpenseSubCategory;
  late String selectedExpenseMode = _expenseModes.first;
  late List<DropdownMenuItem<FavoriteExpenseCategoryModel>> _dropdownMenuItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isScopeSelected = [true, false];
    isTypeSelected = [true, false];
    loadFavoriteData();
  }

  void loadFavoriteData() async {
    var result = await houseDB.readEncryptedUserData(Constants.favExpenseKey);

    if (result != null) {
      setState(() {
        myFavoriteExpenses = uploadDocumentResponseDtoFromJson(result);
        if (myFavoriteExpenses.isNotEmpty) {
          //       selectedExpenseSubCategory = myFavoriteExpenses.first;
        }

        _dropdownMenuItems = buildDropDownMenuItems(myFavoriteExpenses);
        //  selectedExpenseSubCategory = _dropdownMenuItems[0].value!;
        print(myFavoriteExpenses);
      });
    }
  }

  List<DropdownMenuItem<FavoriteExpenseCategoryModel>> buildDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<FavoriteExpenseCategoryModel>> items = [];
    for (FavoriteExpenseCategoryModel listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.subCategoryName),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
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
        child: DropdownButton<FavoriteExpenseCategoryModel>(
            value: selectedExpenseSubCategory,
            dropdownColor: Constants.purpleDark,
            underline: const SizedBox(),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Constants.white,
            ),
            iconSize: 24,
            style: HouseTheme.bodyLight,
            onChanged: (newValue) {
              setState(() {
                selectedExpenseSubCategory = newValue!;
              });
            },
            isExpanded: true,
            items: _dropdownMenuItems));

    //myFavoriteExpenses.map<DropdownMenuItem<String>>(
    //               (FavoriteExpenseCategoryModel value) {
    //             return DropdownMenuItem<String>(
    //               value: value.subCategoryName,
    //               child: Text(
    //                 value.subCategoryName,
    //                 style: HouseTheme.bodyLight,
    //               ),
    //             );
    //           }).toList(),
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
            width: (MediaQuery.of(context).size.width - 48) / 2,
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
            width: (MediaQuery.of(context).size.width - 48) / 2,
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
            width: (MediaQuery.of(context).size.width - 48) / 2,
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
            width: (MediaQuery.of(context).size.width - 48) / 2,
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
    return SingleChildScrollView(
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
          titleAmount,
          amountFormField,
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
    );
  }
}
