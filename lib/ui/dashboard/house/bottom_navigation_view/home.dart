import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/util/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
            height: 235,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Constants.purpleDark,
                    Constants.purple,
                  ]),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: hexToColor("#000000"),
                  offset: const Offset(0.0, 5.0), //(x,y)
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text("Current Balance", style: HouseTheme.titleLight),
                      Text("INR", style: HouseTheme.titleLight)
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "25,000",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  indent: 15,
                  endIndent: 15,
                ),
                Card(
                  elevation: 1,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: const <Widget>[
                            Text("\u20B9 1,00,000.0",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Income",
                                style: TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontWeight: FontWeight.w300)),

                            SizedBox(
                              height: 15,
                            ),
                            Text("\u20B9 25,000.0",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Personal Expense",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),
                        Column(
                          children: const <Widget>[
                            Text("\u20B9 25,000.0",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Savings",
                                style: TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("\u20B9 30,000.0",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("House Expense",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),

                      ],

                    ),

                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 8,
        ),

        //Add Buttons

        /*Container(
              child: ExpenseChartWidget(),
            ),
*/

        Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 3.0,
                shrinkWrap: true,
                children: List.generate(8, (index) {
                  return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Card(
                          elevation: 6,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Constants.purple,
                                Constants.purpleMedium,
                              ]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                            child: InkWell(
                              // inkwell color
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Icon(
                                        dashIcons[index]['icon'],
                                        color: Colors.white,
                                      )),
                                  Text(dashIcons[index]['title'],
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ))
                                ],
                              ),

                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(dashIcons[index]['screen']);
                              },
                            ),
                          )));
                }))),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Transactions",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.black),
              ),
              InkWell(
                child: const Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                      color: Colors.black),
                ),
                onTap: () {
                  //Navigate to recent transaction screen
                },
              )
            ],
          ),
        ),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            cacheExtent: 256,
            children: [
              ...List.generate(
                3,
                (index) => Column(
                  children: [
                    Card(
                      child: ListTile(
                        // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        leading: CircleAvatar(
                          backgroundColor: hexToColor("#18334B"),

                          child: const Text(
                            'C',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                        ),
                        title: const Text(
                          "Salary",
                          style: HouseTheme.titleRegular,
                        ),
                        subtitle:
                            const Text("Credit", style: HouseTheme.bodyDark),
                        trailing: const Text("\u20B9 40000"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        )

        /*Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              alignment: Alignment.topLeft,
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Card(

                        child: ListTile(
                          // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          leading: CircleAvatar(
                            backgroundColor: hexToColor("#18334B"),

                            child: Text('C', style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w500),),
                            //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                          ),
                          title: Text("Salary"),
                          subtitle: Text("Credit"),
                          trailing: Text("\u20B9 40000"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          leading: CircleAvatar(
                            backgroundColor: hexToColor("#18334B"),

                            child: Text('D', style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w500),),
                            //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                          ),
                          title: Text("Rent"),
                          subtitle: Text("Debit"),
                          trailing: Text("\u20B9 17000"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          // contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          leading: CircleAvatar(
                            backgroundColor: hexToColor("#18334B"),

                            child: Text('C', style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w500),),
                            //   child: Icon(FontAwesomeIcons.ad,color: Colors.green,size: 24,),
                          ),
                          title: Text("Petrol"),
                          subtitle: Text("Debit"),
                          trailing: Text("\u20B9 3200"),
                        ),
                      ),
                    ],
                  )
              )

          )
*/
      ],
    );
  }
}
