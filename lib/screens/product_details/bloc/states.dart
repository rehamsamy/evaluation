import 'product_detail_model.dart';

class ProductDetailStates {}

class ProductDetailStateStart extends ProductDetailStates {}

class ProductDetailStateSuccess extends ProductDetailStates {
  ProductDetailModel? data;
  ProductDetailStateSuccess({required
    this.data,
  });
}

class ProductDetailStateFailed extends ProductDetailStates {
  String? msg;
  int? errType, statusCode;
  ProductDetailStateFailed({this.msg, this.errType, this.statusCode});
}


