import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/main.dart';
import 'package:my_planner/models/dto/expense_summary_card_model.dart';
import 'package:my_planner/models/dto/expense_summary_model.dart';
import 'package:my_planner/models/request/generic/search_by_date_request_dto.dart';
import 'package:my_planner/models/response/expense/expense_response_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/personal_expense_summary.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/widget/progress_loader.dart';

import 'house_expense_summary.dart';

class ExpenseSummaryScreen extends StatefulWidget {
  const ExpenseSummaryScreen({Key? key}) : super(key: key);

  @override
  _ExpenseSummaryScreenState createState() => _ExpenseSummaryScreenState();
}

class _ExpenseSummaryScreenState extends State<ExpenseSummaryScreen>
    with WidgetsBindingObserver,AutomaticKeepAliveClientMixin<ExpenseSummaryScreen> {
  List<ExpenseSummaryModel> houseExpenseList = [];


  List<ExpenseSummaryModel> personalExpenseList = [];

  late ExpenseSummaryCardModel expenseSummaryCardModel ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    Future.delayed(Duration.zero, getAllMyExpensesApiCall);
    expenseSummaryCardModel = ExpenseSummaryCardModel();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getAllMyExpensesApiCall();
      print("getAllMyExpensesApiCall");
      //do your stuff
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackAppBarWidget(
            "Expense Summary", true, "add_expense", false, false, () {}, true,
            () {
          getAllMyExpensesApiCall();
        }),
        body: DefaultTabController(
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
                    Tab(text: "House", icon: Icon(Icons.house)),
                    Tab(
                      text: "Personal",
                      icon: Icon(Icons.person),
                    ),
                  ]),
            ),
            Expanded(
              flex: 6,
              child: TabBarView(children: [
                SizedBox(
                  child: HouseExpenseSummaryScreen(
                      houseExpenseList, expenseSummaryCardModel),
                  height: 400,
                ),
                SizedBox(
                    child: PersonalExpenseSummaryScreen(personalExpenseList),
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
        ));
  }

  void getAllMyExpensesApiCall() async {
    SearchByDateRequestDto searchByDateRequestDto =
        SearchByDateRequestDto("01-01-2021");

    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();

      var expensesResponse =
          await onBoardRepository.getMyExpenses(searchByDateRequestDto);

      print(expensesResponse);

      saveExpenses(expensesResponse);

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

  @override
  bool get wantKeepAlive=>true;

  void saveExpenses(List<ExpenseResponseDto> list) {
    print("saveExpenses" + MyApp.isRefreshButtonEnable.toString());

    houseExpenseList.clear();
    personalExpenseList.clear();

    setState(() {
      for (var tempExpenseResponse in list) {
        var expenseSummaryModel = ExpenseSummaryModel(
            tempExpenseResponse.id,
            tempExpenseResponse.expenseName,
            tempExpenseResponse.expenseCategoryName,
            tempExpenseResponse.expenseSubCategoryName,
            tempExpenseResponse.mode,
            tempExpenseResponse.createdBy,
            tempExpenseResponse.createdById,
            tempExpenseResponse.amount,
            tempExpenseResponse.expenseDate,
            tempExpenseResponse.isHouseExpense);
        if (expenseSummaryModel.isHouseExpense) {
          if (expenseSummaryModel.houseMemberUserId == MyApp.userInfo.userId) {
            expenseSummaryCardModel.selfExpense += expenseSummaryModel.amount;
          } else {
            expenseSummaryCardModel.othersExpense += expenseSummaryModel.amount;
          }
          expenseSummaryCardModel.totalHouseExpense +=
              expenseSummaryModel.amount;

          houseExpenseList.add(expenseSummaryModel);
        }
        if (expenseSummaryModel.houseMemberUserId == MyApp.userInfo.userId &&
            !expenseSummaryModel.isHouseExpense) {
          personalExpenseList.add(expenseSummaryModel);
        }
      }


      //  selectedIncomeSource= incomeCategoryList.first;
    });
  }
}
