class AppInfo{
  bool isExpenseRefreshEnable = false;
  bool isFavoriteExpenseRefreshEnable = false;
  bool isIncomeRefreshEnable = false;

  void resetFlags(){
    isExpenseRefreshEnable = false;
    isFavoriteExpenseRefreshEnable = false;
    isIncomeRefreshEnable = false;
  }

}