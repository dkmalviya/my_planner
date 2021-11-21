import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planner/util/utils.dart';

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: Offset(-5, -5),
      blurRadius: 30),
  BoxShadow(
      color: Colors.blue.withOpacity(0.2),
      spreadRadius: 2,
      offset: Offset(7, 7),
      blurRadius: 20)
];

List<BoxShadow> customDarkShadow = [
  BoxShadow(
    color: hexToColor("#000000"),
    offset: Offset(0.0, 3.0), //(x,y)
    blurRadius: 8.0,
  ),
];

List expense = [
  {"name": "Hotel", "amount": 7000.0},
  {"name": "Grocery", "amount": 2000.0},
  {"name": "Fuel", "amount": 1000.0},
  {"name": "Bills", "amount": 6000.0},
  {"name": "Rent", "amount": 17000.0},
  {"name": "Shopping", "amount": 500.0}
];

List dashIcons = [
  {
    "icon": FontAwesomeIcons.wallet,
    "title": "Income",
    "screen": "/income_summary"
  },
  {
    "icon": FontAwesomeIcons.creditCard,
    "title": "Expense",
    "screen": "/expense_summary"
  },
  {
    "icon": FontAwesomeIcons.users,
    "title": "Members",
    "screen": "/house_member"
  },
  {
    "icon": FontAwesomeIcons.solidHeart,
    "title": "Favorite",
    "screen": "/favorite"
  },
  {
    "icon": FontAwesomeIcons.solidBell,
    "title": "Reminder",
    "screen": "/reminder"
  },
  {
    "icon": FontAwesomeIcons.key,
    "title": "Credentials",
    "screen": "/password_summary"
  },
  {
    "icon": FontAwesomeIcons.history,
    "title": "Transactions",
    "screen": "/transaction_summary"
  },
  {"icon": FontAwesomeIcons.checkSquare, "title": "TODO", "screen": "/todo"}
];

List pieColor = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
];

List catergories = [
  {"name": "Rent", "isFavorite": true},
  {"name": "Milk", "isFavorite": true},
  {"name": "Egg", "isFavorite": true},
  {"name": "G-Pay", "isFavorite": false},
  {"name": "Recharge", "isFavorite": true},
  {"name": "Water", "isFavorite": false},
  {"name": "Electricity", "isFavorite": true},
  {"name": "Mobile Bill", "isFavorite": false},
  {"name": "Petrol", "isFavorite": true},
  {"name": "Diesel", "isFavorite": false},
  {"name": "Ice-Cream", "isFavorite": true},
  {"name": "Toll", "isFavorite": false},
  {"name": "Vagitables", "isFavorite": true},
  {"name": "Grocery", "isFavorite": false}
];

List allCategoriesData = [
  {
    "subCategoryName": "House Rent",
    "subCategoryId": 1,
    "categoryName": "Rent",
    "categoryId": 1,
    "isFavorite": false
  },
  {
    "subCategoryName": "Car Rent",
    "subCategoryId": 2,
    "categoryName": "Rent",
    "categoryId": 1,
    "isFavorite": true
  },
  {
    "subCategoryName": "Shop Rent",
    "subCategoryId": 3,
    "categoryName": "Rent",
    "categoryId": 1,
    "isFavorite": true
  },
  {
    "subCategoryName": "Furniture Rent",
    "subCategoryId": 4,
    "categoryName": "Rent",
    "categoryId": 1,
    "isFavorite": true
  },
  {
    "subCategoryName": "Mobile Bill",
    "subCategoryId": 5,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "DTH Bill",
    "subCategoryId": 6,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "Water Bill",
    "subCategoryId": 7,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "Electricity Bill",
    "subCategoryId": 8,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "Water Bill",
    "subCategoryId": 9,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "Land Bill",
    "subCategoryId": 10,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "Broadband Bill",
    "subCategoryId": 11,
    "categoryName": "Bills",
    "categoryId": 2,
    "isFavorite": false
  },
  {
    "subCategoryName": "Cloths",
    "subCategoryId": 12,
    "categoryName": "Shopping",
    "categoryId": 3,
    "isFavorite": false
  },
  {
    "subCategoryName": "Gadget",
    "subCategoryId": 13,
    "categoryName": "Shopping",
    "categoryId": 3,
    "isFavorite": false
  },
  {
    "subCategoryName": "Home Appliances",
    "subCategoryId": 14,
    "categoryName": "Shopping",
    "categoryId": 3,
    "isFavorite": false
  },
  {
    "subCategoryName": "Home Decor",
    "subCategoryId": 15,
    "categoryName": "Shopping",
    "categoryId": 3,
    "isFavorite": false
  },
  {
    "subCategoryName": "Maid",
    "subCategoryId": 16,
    "categoryName": "Servant",
    "categoryId": 4,
    "isFavorite": false
  },
  {
    "subCategoryName": "Driver",
    "subCategoryId": 17,
    "categoryName": "Servant",
    "categoryId": 4,
    "isFavorite": false
  },
  {
    "subCategoryName": "Gaurd",
    "subCategoryId": 18,
    "categoryName": "Servant",
    "categoryId": 4,
    "isFavorite": false
  },
  {
    "subCategoryName": "Petrol",
    "subCategoryId": 19,
    "categoryName": "Fuel",
    "categoryId": 5,
    "isFavorite": false
  },
  {
    "subCategoryName": "Diesel",
    "subCategoryId": 20,
    "categoryName": "Fuel",
    "categoryId": 5,
    "isFavorite": false
  },
  {
    "subCategoryName": "CNG",
    "subCategoryId": 21,
    "categoryName": "Fuel",
    "categoryId": 5,
    "isFavorite": false
  },
  {
    "subCategoryName": "LPG",
    "subCategoryId": 22,
    "categoryName": "Fuel",
    "categoryId": 5,
    "isFavorite": false
  },
];

List sampleExpense = [
  {
    "expenseId": 1,
    "expenseName": "Rent-Aug-2020",
    "mode": "Bank Transfer",
    "houseMember": "Deepesh Malviya",
    "amount": 17000.0,
    "date": "01-08-2020",
    "expenseCategory": "Rent",
    "houseMemberId": 1,
    "expenseSubCategory": "House Rent",
    "isHouseExpense": true,
  },
  {
    "expenseId": 2,
    "expenseName": "Dinner",
    "mode": "Credit Card",
    "houseMember": "Deepesh Malviya",
    "amount": 2000.0,
    "date": "19-08-2020",
    "expenseCategory": "Food",
    "houseMemberId": 1,
    "expenseSubCategory": "Food",
    "isHouseExpense": true
  },
  {
    "expenseId": 3,
    "expenseName": "Monthly Grocery",
    "mode": "Credit Card",
    "houseMember": "Deepesh Malviya",
    "amount": 2500.0,
    "date": "01-08-2020",
    "expenseCategory": "Grocery",
    "houseMemberId": 1,
    "expenseSubCategory": "Grocery",
    "isHouseExpense": true
  },
  {
    "expenseId": 4,
    "expenseName": "Vegetables",
    "mode": "G-pay",
    "houseMember": "Deepesh Malviya",
    "amount": 650.0,
    "date": "12-08-2020",
    "expenseCategory": "Vegitable",
    "houseMemberId": 1,
    "expenseSubCategory": "Vegitable",
    "isHouseExpense": true
  },
  {
    "expenseId": 5,
    "expenseName": "Fruits",
    "mode": "G-pay",
    "houseMember": "Deepesh Malviya",
    "amount": 355.0,
    "date": "20-08-2020",
    "expenseCategory": "Vegitable",
    "houseMemberId": 1,
    "expenseSubCategory": "Fruits",
    "isHouseExpense": true
  },
  {
    "expenseId": 6,
    "expenseName": "RO Water",
    "mode": "G-pay",
    "houseMember": "Priya Malviya",
    "amount": 70.0,
    "date": "01-08-2020",
    "expenseCategory": "Water",
    "houseMemberId": 2,
    "expenseSubCategory": "Water Can 20 Ltr",
    "isHouseExpense": true
  },
  {
    "expenseId": 7,
    "expenseName": "RO Water",
    "mode": "G-pay",
    "houseMember": "Priya Malviya",
    "amount": 70.0,
    "date": "07-08-2020",
    "expenseCategory": "Water",
    "houseMemberId": 2,
    "expenseSubCategory": "Water Can 20 Ltr",
    "isHouseExpense": true
  },
  {
    "expenseId": 8,
    "expenseName": "RO Water",
    "mode": "G-pay",
    "houseMember": "Priya Malviya",
    "amount": 70.0,
    "date": "14-08-2020",
    "expenseCategory": "Water",
    "houseMemberId": 2,
    "expenseSubCategory": "Water Can 20 Ltr",
    "isHouseExpense": true
  },
  {
    "expenseId": 9,
    "expenseName": "RO Water",
    "mode": "G-pay",
    "houseMember": "Priya Malviya",
    "amount": 70.0,
    "date": "21-08-2020",
    "expenseCategory": "Water",
    "houseMemberId": 2,
    "expenseSubCategory": "Water Can 20 Ltr",
    "isHouseExpense": true
  },
  {
    "expenseId": 10,
    "expenseName": "Education loan",
    "mode": "Online",
    "houseMember": "Priya Malviya",
    "amount": 9500.0,
    "date": "05-08-2020",
    "expenseCategory": "Loan",
    "houseMemberId": 2,
    "expenseSubCategory": "Education Loan",
    "isHouseExpense": false
  },
  {
    "expenseId": 11,
    "expenseName": "Personal Loan",
    "mode": "Online",
    "houseMember": "Priya Malviya",
    "amount": 5000.0,
    "date": "05-08-2020",
    "expenseCategory": "Loan",
    "houseMemberId": 2,
    "expenseSubCategory": "Personal Loan",
    "isHouseExpense": false
  },
  {
    "expenseId": 12,
    "expenseName": "Personal Loan",
    "mode": "Online",
    "houseMember": "Deepesh Malviya",
    "amount": 2400.0,
    "date": "05-08-2020",
    "expenseCategory": "Loan",
    "houseMemberId": 1,
    "expenseSubCategory": "Personal Loan",
    "isHouseExpense": false
  },
  {
    "expenseId": 13,
    "expenseName": "Car Loan",
    "mode": "Online",
    "houseMember": "Deepesh Malviya",
    "amount": 16959.0,
    "date": "03-08-2020",
    "expenseCategory": "Loan",
    "houseMemberId": 1,
    "expenseSubCategory": "Car Loan",
    "isHouseExpense": false
  },
];

List sampleReminder = [
  {
    "id": 1,
    "name": "Priya Malviya",
    "occasion": "Birthday",
    "isNotificationEnable": false,
    "occasionDate": "11-01-1994"
  },
  {
    "id": 2,
    "name": "Deepesh Malviya",
    "occasion": "Birthday",
    "isNotificationEnable": true,
    "occasionDate": "14-03-1991"
  },
  {
    "id": 3,
    "name": "My Wedding Anniversary",
    "occasion": "Wedding",
    "isNotificationEnable": true,
    "occasionDate": "03-02-2020"
  },
  {
    "id": 4,
    "name": "Itr Return",
    "occasion": "Work",
    "isNotificationEnable": false,
    "occasionDate": "20-09-2020"
  },
  {
    "id": 5,
    "name": "My House Inauguration",
    "occasion": "Inauguration",
    "isNotificationEnable": false,
    "occasionDate": "20-01-1999"
  },
];

List occations = [
  {"occasionName": "Birthday", "icon": Icons.cake},
  {"occasionName": "Wedding", "icon": Icons.group},
  {"occasionName": "Work", "icon": Icons.work},
  {"occasionName": "Inauguration", "icon": Icons.lock_open},
  {"occasionName": "Event", "icon": FontAwesomeIcons.calendar},
];

List sampleIncome = [
  {
    "incomeSourceType": "Salary",
    "mode": "Bank Transfer",
    "houseMember": "Deepesh Malviya",
    "amount": 39000.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
  {
    "incomeSourceType": "Interest",
    "mode": "Bank Transfer",
    "houseMember": "Deepesh Malviya",
    "amount": 500.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
  {
    "incomeSourceType": "Cashback",
    "mode": "G-Pay",
    "houseMember": "Deepesh Malviya",
    "amount": 1000.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
  {
    "incomeSourceType": "Return",
    "mode": "Bank Transfer",
    "houseMember": "Deepesh Malviya",
    "amount": 1000.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
  {
    "incomeSourceType": "Gift",
    "mode": "G-Pay",
    "houseMember": "Priya Malviya",
    "amount": 1000.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
  {
    "incomeSourceType": "Salary",
    "mode": "Bank Transfer",
    "houseMember": "Priya Malviya",
    "amount": 30000.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
  {
    "incomeSourceType": "ITR-Return",
    "mode": "Online",
    "houseMember": "Priya Malviya",
    "amount": 5000.0,
    "houseMemberId": "c83767b0-694b-11eb-aed3-2f87b7236fb1"
  },
];

//Sample CheckList
List sampleTodoList = [
  {
    "activityName": "Grocery Shopping",
    "date": "2020-02-28",
    "isCompleted": false,
    "priority": "High"
  },
  {
    "activityName": "Laptop Repair",
    "date": "2020-02-28",
    "isCompleted": false,
    "priority": "Low"
  },
  {
    "activityName": "Cleaning",
    "date": "2020-02-27",
    "isCompleted": true,
    "priority": "Medium"
  },
  {
    "activityName": "Diesel Top up",
    "date": "2020-02-26",
    "isCompleted": false,
    "priority": "High"
  },
  {
    "activityName": "Tata Sky Recharge",
    "date": "2020-02-25",
    "isCompleted": true,
    "priority": "Low"
  },
  {
    "activityName": "FD Renewal",
    "date": "2020-02-28",
    "isCompleted": false,
    "priority": "High"
  },
  {
    "activityName": "Vegitables",
    "date": "2020-02-28",
    "isCompleted": true,
    "priority": "Medium"
  },
  {
    "activityName": "Netflix Un-Subscribe ",
    "date": "2020-02-28",
    "isCompleted": false,
    "priority": "Low"
  }
];

List accountImages = [
  {"accountName": "gmail", "image": "assets/images/accounts/gmail.png"},
  {"accountName": "facebook", "image": "assets/images/accounts/facebook.png"},
  {"accountName": "outlook", "image": "assets/images/accounts/outlook.png"},
  {"accountName": "git", "image": "assets/images/accounts/git.png"},
  {"accountName": "linkedin", "image": "assets/images/accounts/linkedin.png"},
  {"accountName": "twitter", "image": "assets/images/accounts/twitter.png"},
  {"accountName": "instagram", "image": "assets/images/accounts/instagram.png"},
  {"accountName": "atos", "image": "assets/images/accounts/atos.png"},
  {"accountName": "bank", "image": "assets/images/accounts/bank.png"},
  {"accountName": "work", "image": "assets/images/accounts/work.png"}
];

List sampleMembers = [
  {
    "memberId": 1,
    "houseMemberName": "Deepesh Malviya",
    "age": 31,
    "gender": "Male",
    "memberType": "Admin",
    "relation": "Couple",
    "profilePictureUrl": "https://picsum.photos/200/300?random=1",
    "isActive": true,
    "mobile": "7774043339",
    "email": "deepeshmalviya@outlook.com",
    "createdOn": "20-06-2021"
  },
  {
    "memberId": 2,
    "houseMemberName": "Priya Malviya",
    "age": 26,
    "gender": "Female",
    "memberType": "Member",
    "relation": "Couple",
    "profilePictureUrl": "https://picsum.photos/200/300?random=2",
    "isActive": true,
    "mobile": "7888042229",
    "email": "priyamalviya058@gmail.com",
    "createdOn": "20-06-2021"
  },
];
