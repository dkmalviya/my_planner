import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/main.dart';
import 'package:my_planner/models/dto/expense_summary_card_model.dart';
import 'package:my_planner/models/dto/expense_summary_model.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/util/utils.dart';

class HouseExpenseSummaryScreen extends StatefulWidget {
  final List<ExpenseSummaryModel> myExpenses;
  final ExpenseSummaryCardModel expenseSummaryCardModel;


  const HouseExpenseSummaryScreen(this.myExpenses, this.expenseSummaryCardModel, {Key? key})
      : super(key: key);



  @override
  State<HouseExpenseSummaryScreen> createState() =>
      _HouseExpenseSummaryScreenState();
}

class _HouseExpenseSummaryScreenState extends State<HouseExpenseSummaryScreen> {
  var userName = MyApp.userInfo.firstName + " " + MyApp.userInfo.lastName;

  double selfExpense = 0;
  double otherExpense = 0;
  double totalHouseExpense = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
       selfExpense = widget.expenseSummaryCardModel.selfExpense;
       otherExpense = widget.expenseSummaryCardModel.othersExpense;
       totalHouseExpense = widget.expenseSummaryCardModel.totalHouseExpense;

    });

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
          child: Container(
            margin: const EdgeInsets.all(Constants.cardPadding),
            width: MediaQuery.of(context).size.width,
            height: 190,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Constants.purpleDark,
                    Constants.purple,
                  ]),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 5.0), //(x,y)
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: const Text("Total Expense",
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: HouseTheme.titleLight),
                ),
                Text(
                  "\u20B9 $totalHouseExpense",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(
                  color: Colors.white,
                  indent: 15,
                  endIndent: 15,
                ),
                Card(
                  elevation: 1,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("\u20B9 $selfExpense",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(userName,
                                style: const TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text("\u20B9 $otherExpense",
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Others",
                                style: TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontWeight: FontWeight.w300))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Recent House Expenses :",
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
                itemCount: widget.myExpenses.length,
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
                        child: Center(
                            child: Text(
                          widget.myExpenses
                              .elementAt(index)
                              .houseMemberName
                              .substring(0, 1),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )),
                      ),

                      /*CircleAvatar(
                        backgroundColor: hexToColor("#18334B"),
                        child: occasionIcon(sampleReminder[index]['occasion']),
                      ),*/

                      title: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          widget.myExpenses.elementAt(index).expenseName,
                          style: HouseTheme.titleDark,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Created  By : ' +
                                  widget.myExpenses
                                      .elementAt(index)
                                      .houseMemberName,
                              style: HouseTheme.bodyDark,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Amount : ' +
                                  widget.myExpenses
                                      .elementAt(index)
                                      .amount
                                      .toString(),
                              style: HouseTheme.bodyDark,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              'Mode : ' +
                                  widget.myExpenses.elementAt(index).mode,
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
