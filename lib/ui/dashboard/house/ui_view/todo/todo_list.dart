import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/models/todo_model.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/utils.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static Set<TodoModel> myTodoList = {};
  static Set<TodoModel> completedList = {};
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    myTodoList.clear();
    completedList.clear();

    for (var testModel in sampleTodoList) {
      TodoModel checkListModelTemp = TodoModel(
          testModel['activityName'],
          DateTime.parse(testModel['date']),
          testModel['isCompleted'],
          testModel['priority']);
      setState(() {
        myTodoList.add(checkListModelTemp);
        if (checkListModelTemp.isCompleted) {
          completedList.add(checkListModelTemp);
        }
      });
    }
  }

  Widget leadingIcon(int index) {
    String priority = myTodoList.elementAt(index).priority;
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          gradient: priority == "High"
              ? redGradient
              : priority == "Medium"
                  ? greenGradient
                  : yellowGradient,
          boxShadow: customDarkShadow),
      child: Center(
          child: Text(
        priority == "High"
            ? "High"
            : priority == "Medium"
                ? "Medium"
                : "Low",
        style: const TextStyle(
            color: Constants.purpleDark,
            fontSize: 10,
            fontWeight: FontWeight.w600),
      )),
    );
  }

  Widget completedButton(bool isCompleted, int index) {
    if (isCompleted == true) {
      return IconButton(
        icon: const Icon(
          FontAwesomeIcons.solidCheckSquare,
          color: Constants.purpleDark,
        ),
        onPressed: () {
          setState(() {
            myTodoList.elementAt(index).isCompleted = false;
          });
        },
      );
    } else {
      return IconButton(
        icon: const Icon(
          FontAwesomeIcons.square,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            myTodoList.elementAt(index).isCompleted = true;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final toDoView = ListView.builder(
        cacheExtent: 256,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        itemCount: myTodoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              leading: leadingIcon(index),

              /*CircleAvatar(
                        backgroundColor: hexToColor("#18334B"),
                        child: occasionIcon(sampleReminder[index]['occasion']),
                      ),*/

              title: Text(
                myTodoList.elementAt(index).activityName,
                style: HouseTheme.subTitleDark,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Date : ' +
                        formattedDate(myTodoList.elementAt(index).dateTime),
                    style: HouseTheme.bodyDark,
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  completedButton(
                      myTodoList.elementAt(index).isCompleted, index),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.delete_forever,
                    size: 32,
                    color: Colors.red[200],
                  ),
                ],
              ),
              onTap: () {},
            ),
          );
        });

    final completedView = ListView.builder(
        cacheExtent: 256,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        itemCount: completedList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              leading: const Icon(
                FontAwesomeIcons.clipboardCheck,
                size: 36,
                color: Constants.greenDark,
              ),

              /*CircleAvatar(
                        backgroundColor: hexToColor("#18334B"),
                        child: occasionIcon(sampleReminder[index]['occasion']),
                      ),*/

              title: Text(
                completedList.elementAt(index).activityName,
                style: HouseTheme.subTitleDark,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Date : ' +
                          formattedDate(
                              completedList.elementAt(index).dateTime),
                      style: HouseTheme.bodyDark),
                ],
              ),
              onLongPress: () {
                print("delete Called");
              },
            ),
          );
        });

    return Scaffold(
        appBar: BackAppBarWidget(
            "Todo List", true, "add_todo", false, false, () {}),
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
                    Tab(
                        text: "To Do",
                        icon: Icon(FontAwesomeIcons.clipboardList)),
                    Tab(
                      text: "Completed",
                      icon: Icon(FontAwesomeIcons.clipboardCheck),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 6,
              child: TabBarView(children: [
                SizedBox(
                  child: toDoView,
                  height: 400,
                ),
                SizedBox(child: completedView, height: 400),
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
