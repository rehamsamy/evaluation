import 'product_model.dart';

class ProductStates {}

class ProductStateStart extends ProductStates {}

class ProductStateSuccess extends ProductStates {
  ProductModel? data;
  ProductStateSuccess({required
    this.data,
  });
}

class ProductStateFailed extends ProductStates {
  String? msg;
  int? errType, statusCode;
  ProductStateFailed({this.msg, this.errType, this.statusCode});
}


