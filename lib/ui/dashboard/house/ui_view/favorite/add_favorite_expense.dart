import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/models/fav_expense_category_model.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/back_app_bar_widget.dart';
import 'package:my_planner/util/house_db.dart';
import 'package:my_planner/util/utils.dart';

import '../../house_theme.dart';

class AddFavoriteExpense extends StatefulWidget {
  const AddFavoriteExpense({Key? key}) : super(key: key);

  @override
  _AddFavoriteExpenseState createState() => _AddFavoriteExpenseState();
}

class _AddFavoriteExpenseState extends State<AddFavoriteExpense> {
  HouseDB houseDB = HouseDB();

  List<FavoriteExpenseCategoryModel> allCategories = [];
  List<FavoriteExpenseCategoryModel> _filteredCategoryList = [];

  String? _result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCategories.clear();
    _filteredCategoryList.clear();

    for (var testModel in allCategoriesData) {
      FavoriteExpenseCategoryModel expenseCategoryModelTemp =
          FavoriteExpenseCategoryModel(
              testModel['subCategoryName'],
              testModel['subCategoryId'],
              testModel['categoryName'],
              testModel['categoryId'],
              testModel['isFavorite']);
      setState(() {
        allCategories.add(expenseCategoryModelTemp);
        _filteredCategoryList.add(expenseCategoryModelTemp);
      });
    }
  }

  saveFavoriteList() async {
    _filteredCategoryList.removeWhere((element) => element.isFavorite == false);
    await houseDB.saveEncryptedUserData(Constants.favExpenseKey,
        uploadDocumentResponseDtoToJson(_filteredCategoryList));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Widget heartIcon(bool isFav) {
      if (isFav) {
        return const Icon(
          FontAwesomeIcons.solidHeart,
          color: Constants.redLight,
        );
      } else {
        return const Icon(
          FontAwesomeIcons.heart,
          color: Constants.redLight,
        );
      }
    }

    return Scaffold(
      appBar: BackAppBarWidget(
          "Add Favorite Expense", false, "", true, false, () {}),
      body: Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: hexToColor("#B5AAE1"),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Constants.purpleMedium,
                          Constants.purpleDark,
                        ]),
                    boxShadow: customDarkShadow),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Constants.purpleDark, Constants.purple]),
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
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                            enableInteractiveSelection: false,
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 16),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here",
                              hintStyle: HouseTheme.caption,
                              suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: Constants.white,
                                  ),
                                  onPressed: () async {}),
                            ),
                            onChanged: (string) {
                              setState(() {
                                _filteredCategoryList = allCategories
                                    .where((asset) => (asset.subCategoryName
                                        .toUpperCase()
                                        .contains(string.toUpperCase())))
                                    .toList();
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    cacheExtent: 256,
                    itemCount: _filteredCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              _filteredCategoryList[index].subCategoryName,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 2),
                            child: Text(
                              'Category : ' +
                                  _filteredCategoryList[index].categoryName,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          trailing: heartIcon(
                              _filteredCategoryList[index].isFavorite),
                          onTap: () {
                            setState(() {
                              _filteredCategoryList[index].isFavorite = true;
                            });

                            print(_filteredCategoryList[index]);
                          },
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 70, right: 70),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Constants.purpleDark)),
                  onPressed: () {
                    saveFavoriteList();
                  },
                  padding: const EdgeInsets.fromLTRB(50.0, 12.0, 50.0, 12.0),
                  color: Constants.purpleDark,
                  child: const Text("Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0)),
                ),
              ),
            ],
          )),
    );
  }
}
