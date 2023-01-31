class ProductInputData {
  int? categoryId;
  ProductInputData({this.categoryId});
  Map<String, dynamic> toJson() {
    return {
      "category_id": categoryId,
    };
  }
}

