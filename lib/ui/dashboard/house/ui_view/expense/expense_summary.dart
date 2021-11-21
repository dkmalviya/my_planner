import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/personal_expense_summary.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';

import 'house_expense_summary.dart';

class ExpenseSummaryScreen extends StatefulWidget {
  const ExpenseSummaryScreen({Key? key}) : super(key: key);

  @override
  _ExpenseSummaryScreenState createState() => _ExpenseSummaryScreenState();
}

class _ExpenseSummaryScreenState extends State<ExpenseSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackAppBarWidget(
            "Expense Summary", true, "add_expense", false, false, () {}),
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
            const Expanded(
              flex: 6,
              child: TabBarView(children: [
                SizedBox(
                  child: HouseExpenseSummaryScreen(),
                  height: 400,
                ),
                SizedBox(child: PersonalExpenseSummaryScreen(), height: 400),
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
}
