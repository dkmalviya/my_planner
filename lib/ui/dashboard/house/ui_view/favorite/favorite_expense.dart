import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/models/dto/fav_expense_category_model.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/house_db.dart';

class FavoriteExpenseScreen extends StatefulWidget {
  const FavoriteExpenseScreen({Key? key}) : super(key: key);

  @override
  _FavoriteExpenseScreenState createState() => _FavoriteExpenseScreenState();
}

class _FavoriteExpenseScreenState extends State<FavoriteExpenseScreen> {
  static List<FavoriteExpenseCategoryModel> myFavoriteExpenses = [];
  HouseDB houseDB = HouseDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFavoriteExpenses.clear();

    loadFavoriteData();
  }

  void loadFavoriteData() async {
    var result = await houseDB.readEncryptedUserData(Constants.favExpenseKey);

    if (result != null) {
      setState(() {
        myFavoriteExpenses = uploadDocumentResponseDtoFromJson(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBarWidget(
          "Favorite", true, "add_favorite_expense", false, false, () {}),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  cacheExtent: 256,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  itemCount: myFavoriteExpenses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Constants.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            myFavoriteExpenses.elementAt(index).subCategoryName,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 2),
                          child: Text(
                            'Category : ' +
                                myFavoriteExpenses
                                    .elementAt(index)
                                    .categoryName,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.delete_forever,
                          size: 32,
                          color: Colors.red[200],
                        ),
                        onTap: () {},
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
