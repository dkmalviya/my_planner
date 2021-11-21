import 'dart:convert';

List<FavoriteExpenseCategoryModel> uploadDocumentResponseDtoFromJson(
        String str) =>
    List<FavoriteExpenseCategoryModel>.from(
        json.decode(str).map((x) => FavoriteExpenseCategoryModel.fromJson(x)));

String uploadDocumentResponseDtoToJson(
        List<FavoriteExpenseCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteExpenseCategoryModel {
  String subCategoryName;
  int subCategoryId;
  String categoryName;
  int categoryId;
  bool isFavorite;

  FavoriteExpenseCategoryModel(this.subCategoryName, this.subCategoryId,
      this.categoryName, this.categoryId, this.isFavorite);

  Map toJson() => {
        'subCategoryName': subCategoryName,
        'subCategoryId': subCategoryId,
        'categoryName': categoryName,
        'categoryId': categoryId,
        'isFavorite': isFavorite,
      };

  factory FavoriteExpenseCategoryModel.fromJson(dynamic json) {
    return FavoriteExpenseCategoryModel(
        json['subCategoryName'] as String,
        json['subCategoryId'] as int,
        json['categoryName'] as String,
        json['categoryId'] as int,
        json['isFavorite'] as bool);
  }

  @override
  String toString() {
    return 'FavoriteExpenseCategoryModel{subCategoryName: $subCategoryName, subCategoryId: $subCategoryId, categoryName: $categoryName, categoryId: $categoryId, isFavorite: $isFavorite}';
  }
}
