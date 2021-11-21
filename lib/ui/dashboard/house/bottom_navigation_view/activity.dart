import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/charts.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(children: <Widget>[
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Constants.purpleLight, boxShadow: customDarkShadow),
          child: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blueGrey,
              tabs: [
                Tab(text: "Transactions"),
                Tab(text: "Graph"),
              ]),
        ),
        Expanded(
          flex: 6,
          child: TabBarView(children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: LineChartSample2(),
              height: 400,
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: PieChartSample2(),
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
