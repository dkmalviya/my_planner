import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PersonalExpenseChart extends StatelessWidget {
  List<PieChartSectionData> paiChartSelectionData = [];

  PersonalExpenseChart(this.paiChartSelectionData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 00,
              startDegreeOffset: -40,
              sections: paiChartSelectionData,
            ),
          ),
        ],
      ),
    );
  }
}
