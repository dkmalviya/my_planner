import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/add_expense.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/income/add_income.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

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
              child: const AddExpenseScreen(),
              height: 400,
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const AddIncomeScreen(),
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
}
