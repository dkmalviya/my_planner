import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/util/ui_utils.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({Key? key}) : super(key: key);

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final List<String> _incomeSources = [
    "Salary",
    "Gift",
    "ITR Return",
    "Cashback",
    "Interest",
    "Profit",
    "Bonus",
    "Resell",
    "Loan",
    "Provident Fund",
    "Others"
  ];
  final List<String> _incomeModes = [
    "Online",
    "Bank Transfer",
    "Cash",
    "G-Pay",
    "Others"
  ];

  TextEditingController categoryTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();

  late String selectedIncomeSource = _incomeSources.first;
  late String selectedIncomeMode = _incomeModes.first;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        child: DropdownButton<String>(
          value: selectedIncomeSource,
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
              selectedIncomeSource = newValue!;
            });
          },
          isExpanded: true,
          items: _incomeSources.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
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
          controller: amountTextController,
          decoration: const InputDecoration(
            hintText: "Enter Amount",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));

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
