class ProductDetailInputData {
  int? productId;
  ProductDetailInputData({this.productId});
  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
    };
  }
}

