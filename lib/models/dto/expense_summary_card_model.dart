class ExpenseSummaryCardModel{
  double totalHouseExpense=0;
  double selfExpense=0;
  double othersExpense=0;

  @override
  String toString() {
    return 'ExpenseSummaryCardModel{totalHouseExpense: $totalHouseExpense, selfExpense: $selfExpense, othersExpense: $othersExpense}';
  }
}