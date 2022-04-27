class IncomeCategoryModel {
  int incomeSourceId;
  String incomeSourceName;

  IncomeCategoryModel(this.incomeSourceId, this.incomeSourceName);

  @override
  String toString() {
    return 'IncomeCategoryModel{incomeSourceId: $incomeSourceId, incomeSourceName: $incomeSourceName}';
  }
}
