import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/step_view_tile.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/utils.dart';

class StepView extends StatelessWidget with PreferredSizeWidget {
  final List<bool> processStepStatus;

  const StepView(this.processStepStatus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: stepCardDecoration,
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            cacheExtent: 256,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            children: [
              StepViewTile(
                  const Icon(
                    Icons.mark_email_read_outlined,
                    color: Constants.purpleDark,
                  ),
                  "Verify",
                  processStepStatus[0],
                  () {}),
              StepViewTile(
                  const Icon(Icons.person, color: Constants.purpleDark),
                  "Profile",
                  processStepStatus[1],
                  () {}),
              StepViewTile(const Icon(Icons.house, color: Constants.purpleDark),
                  "House", processStepStatus[2], () {}),
              StepViewTile(
                  const Icon(Icons.verified_outlined,
                      color: Constants.purpleDark),
                  "Complete",
                  processStepStatus[3],
                  () {})
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(110);
  }
}
