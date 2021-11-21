import 'dart:collection';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/main.dart';
import 'package:my_planner/models/dto/expense_summary_model.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/personal_expense_chart.dart';
import 'package:my_planner/util/utils.dart';

class PersonalExpenseSummaryScreen extends StatefulWidget {
  const PersonalExpenseSummaryScreen({Key? key}) : super(key: key);

  @override
  State<PersonalExpenseSummaryScreen> createState() =>
      _PersonalExpenseSummaryScreenState();
}

class _PersonalExpenseSummaryScreenState
    extends State<PersonalExpenseSummaryScreen> {
  List<ExpenseSummaryModel> myExpenses = [];
  List<PieChartSectionData> paiChartSelectionDatas = [];

  Map graphDataMap = HashMap<String, double>();
  int graphItemsCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myExpenses.clear();

    loadMyExpenses();
  }

  void setGraphData() {
    int i = 0;

    setState(() {
      for (var element in myExpenses) {
        if (graphDataMap.containsKey(element.expenseCategory)) {
          double amount = graphDataMap[element.expenseCategory];
          graphDataMap[element.expenseCategory] = amount + element.amount;
        } else {
          graphDataMap.putIfAbsent(
              element.expenseCategory, () => element.amount);
        }
      }

      var sortedKeys = graphDataMap.keys.toList(growable: false)
        ..sort((k1, k2) => graphDataMap[k2].compareTo(graphDataMap[k1]));
      LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
          key: (k) => k, value: (k) => graphDataMap[k]);
      print(sortedMap);

      sortedMap.forEach((key, value) {
        graphItemsCount = graphItemsCount - 4;
        print("test" + key.toString() + " : " + value.toString());
        PieChartSectionData temp = PieChartSectionData(
            color: Constants.graphColor[i++],
            value: value,
            title: "Asd",
            showTitle: false,
            radius: 90);
        paiChartSelectionDatas.add(temp);
      });
    });

    print(graphDataMap.toString());
  }

  loadMyExpenses() async {
    for (var testModel in sampleExpense) {
      ExpenseSummaryModel expenseSummaryModel = ExpenseSummaryModel(
          testModel['expenseId'],
          testModel['expenseName'],
          testModel['expenseCategory'],
          testModel['expenseSubCategory'],
          testModel['mode'],
          testModel['houseMember'],
          testModel['houseMemberId'],
          testModel['amount'],
          testModel['date'],
          testModel['isHouseExpense']);
      if (expenseSummaryModel.houseMemberId == MyApp.userInfo.userId) {
        setState(() {
          myExpenses.add(expenseSummaryModel);
        });
      }
    }
    setState(() {
      setGraphData();
    });
  }

  Widget expenseIcon(isHouseExpense) {
    if (isHouseExpense) {
      return const Center(
          child: Icon(
        Icons.house,
        color: Constants.white,
      ));
    } else {
      return const Center(child: Icon(Icons.person, color: Constants.white));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Constants.purpleDark,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Constants.purpleDark,
                    Constants.purple,
                  ]),
              boxShadow: customDarkShadow),
          child: SizedBox(
            height: 200,
            child: PersonalExpenseChart(paiChartSelectionDatas),
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Recent Personal Expenses :",
              style: HouseTheme.titleDark,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                cacheExtent: 256,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                itemCount: myExpenses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: hexToColor("#B5AAE1"),
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Constants.purpleDark,
                                  Constants.purple,
                                  Constants.purpleMedium,
                                ]),
                            boxShadow: customDarkShadow),
                        child: expenseIcon(
                            myExpenses.elementAt(index).isHouseExpense),
                      ),

                      /*CircleAvatar(
                        backgroundColor: hexToColor("#18334B"),
                        child: occasionIcon(sampleReminder[index]['occasion']),
                      ),*/

                      title: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          myExpenses.elementAt(index).expenseName,
                          style: HouseTheme.titleDark,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Category : ' +
                                  myExpenses.elementAt(index).expenseCategory +
                                  " - " +
                                  myExpenses
                                      .elementAt(index)
                                      .expenseSubCategory,
                              style: HouseTheme.bodyDark,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Created  By : ' +
                                  myExpenses.elementAt(index).houseMember,
                              style: HouseTheme.bodyDark,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Amount : ' +
                                  myExpenses.elementAt(index).amount.toString(),
                              style: HouseTheme.bodyDark,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Mode : ' + myExpenses.elementAt(index).mode,
                              style: HouseTheme.bodyDark,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.delete_forever,
                        size: 32,
                        color: Colors.red[200],
                      ),
                      onTap: () {},
                    ),
                  );
                }))
      ],
    );
  }
}
