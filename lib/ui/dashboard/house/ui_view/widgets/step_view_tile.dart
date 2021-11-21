import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';

class StepViewTile extends StatelessWidget {
  final Icon tileIcon;
  final String title;
  final bool isCompleted;
  final VoidCallback onTap;

  const StepViewTile(this.tileIcon, this.title, this.isCompleted, this.onTap,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      InkWell(
        child: Card(
            child: SizedBox(
              height: 34,
              width: 34,
              child: tileIcon,
            ),
            color: isCompleted ? Constants.yellow : Constants.disableColor),
        onTap: onTap,
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Container(
            height: 4,
            width: (MediaQuery.of(context).size.width - 90) / 8,
            color: isCompleted ? Constants.yellow : Constants.disableColor,
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? Constants.yellow : Constants.disableColor,
            ),
          ),
          Container(
            height: 4,
            width: (MediaQuery.of(context).size.width - 90) / 8,
            color: isCompleted ? Constants.yellow : Constants.disableColor,
          )
        ],
      ),
      const SizedBox(
        height: 6,
      ),
      Text(
        title,
        style: TextStyle(
          // Caption -> caption
          fontWeight: FontWeight.w400,
          fontSize: 12,
          letterSpacing: 0.2,
          color: isCompleted
              ? Constants.yellow
              : Constants.disableColor, // was lightText
        ),
      ),
    ]);
  }
}
