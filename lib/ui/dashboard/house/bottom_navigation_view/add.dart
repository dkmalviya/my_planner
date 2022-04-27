import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/models/dto/expense_category_model.dart';
import 'package:my_planner/models/dto/income_category_model.dart';
import 'package:my_planner/models/response/expense/expense_category_response_dto.dart';
import 'package:my_planner/models/response/income/income_source_response_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/add_expense.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/add_expense_from_favorite.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/income/add_income.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/widget/progress_loader.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<IncomeCategoryModel> incomeCategoryList=[];
  List<ExpenseCategoryModel> expenseCategoryList=[];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Future.delayed(Duration.zero, getAllExpenseCategory);


    //
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(children: <Widget>[
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Constants.purpleDark, boxShadow: customDarkShadow),
          child: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blueGrey,
              tabs: [
                Tab(text: "Expense"),
                Tab(text: "Income"),
              ]),
        ),
        Expanded(
          flex: 6,
          child: TabBarView(children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child:  const AddExpenseFromFavoriteScreen(),
              height: 400,
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: AddIncomeScreen(incomeCategoryList),
                height: 400),
          ]),
        )

        /*Container(
                      height: double.maxFinite,
                      width: double.maxFinite,

                      child: TabBarView(children: [
                        Container(
                            child:  LineChartSample2(),
                        ),
                        Container(
                            child:  PieChartSample2(),
                        ),

                      ]),

                    )

*/
      ]),
    );
  }

  getAllIncomeCategory() async {
    incomeCategoryList.clear();

    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var incomeResponse = await onBoardRepository
          .getAllIncomeCategory();

      print(incomeResponse);

      saveIncomeCategory(incomeResponse);

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


  void saveIncomeCategory(List<IncomeSourceResponseDto> list) {
    setState(() {
      for (var tempIncomeResponse in list) {

        var incomeSource = IncomeCategoryModel(
            tempIncomeResponse.incomeSourceId,
            tempIncomeResponse.incomeSourceName
        );
        incomeCategoryList.add(incomeSource);


      }

    //  selectedIncomeSource= incomeCategoryList.first;
    });

  }


  getAllExpenseCategory() async {
    expenseCategoryList.clear();

    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var expenseCategoryResponse = await onBoardRepository
          .getAllExpenseCategory();

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
            tempExpenseResponse.expenseCategoryName
        );
        expenseCategoryList.add(expenseCategory);


      }

      //  selectedIncomeSource= incomeCategoryList.first;
    });

    getAllIncomeCategory();

  }


}
