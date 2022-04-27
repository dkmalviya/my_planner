import 'package:flutter/material.dart';
import 'package:my_planner/ui/dashboard/house/house_app_home_screen.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/add_expense.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/expense/expense_summary.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/favorite/add_favorite_expense.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/favorite/favorite_expense.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/house/house_member.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/house/invite_house_member.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/reminder/add_reminder.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/reminder/reminder.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/todo/add_todo.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/todo/todo_list.dart';
import 'package:my_planner/ui/perlogin/login/login_screen.dart';
import 'package:my_planner/ui/perlogin/signup/registration_screen.dart';
import 'package:my_planner/ui/perlogin/splash/splash_screen.dart';
import 'package:my_planner/ui/perlogin/validate_token/validate_token.dart';
import 'package:my_planner/ui/profile/add_house_details.dart';
import 'package:my_planner/ui/profile/add_personal_details.dart';
import 'package:my_planner/ui/profile/info_screen.dart';
import 'package:my_planner/ui/profile/search_house_details.dart';
import 'package:my_planner/ui/profile/success_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case '/validate_token':
        return MaterialPageRoute(builder: (_) => const ValidateToken());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HouseAppHomeScreen());
      case '/expense_summary':
        return MaterialPageRoute(builder: (_) => const ExpenseSummaryScreen());
      case '/add_expense':
        return MaterialPageRoute(builder: (_) => const AddExpenseScreen());
      case '/house_member':
        return MaterialPageRoute(builder: (_) => const HouseMemberScreen());
      case '/add_house_member':
        return MaterialPageRoute(builder: (_) => const InviteHouseMember());
      case '/favorite':
        return MaterialPageRoute(builder: (_) => const FavoriteExpenseScreen());
      case '/add_favorite_expense':
        return MaterialPageRoute(builder: (_) => const AddFavoriteExpense());
      case '/reminder':
        return MaterialPageRoute(builder: (_) => const ReminderScreen());
      case '/add_reminder':
        return MaterialPageRoute(builder: (_) => const AddReminderScreen());
      case '/income_summary':
      //   return MaterialPageRoute(builder: (_) => IncomeSummary());
      case '/todo':
        return MaterialPageRoute(builder: (_) => const TodoList());
      case '/add_todo':
        return MaterialPageRoute(builder: (_) => const AddTodoScreen());
      case '/add_income':
      //   return MaterialPageRoute(builder: (_) => AddIncome());
      case '/add_favorite':
      //  return MaterialPageRoute(builder: (_) => AddIncome());

      case '/password_summary':
      //  return MaterialPageRoute(builder: (_) => CredentialsHome());
      case '/verify_token':
        return MaterialPageRoute(builder: (_) => const InfoScreen());

      case '/add_profile':
        return MaterialPageRoute(builder: (_) => const AddPersonalDetails());

      case '/search_house':
        return MaterialPageRoute(builder: (_) => const SearchHouseDetails());
      case '/add_house':

        final houseModel = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  AddHouseDetails(houseModel));
      case '/success':
        return MaterialPageRoute(builder: (_) => const SuccessScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
