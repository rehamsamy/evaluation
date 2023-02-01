import 'package:evaluation/helpers/core_classes/server_gate.dart';
import 'package:evaluation/screens/home/bloc/events.dart';
import 'package:evaluation/screens/home/bloc/states.dart';
import 'package:evaluation/screens/product_details/bloc/events.dart';
import 'package:evaluation/screens/product_details/bloc/product_detail_model.dart';
import 'package:evaluation/screens/product_details/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvents, ProductDetailStates> {
  ProductDetailBloc() : super(ProductDetailStateStart()) {
    on<ProductDetailEventStart>(_sendRequest);
  }
  ServerGate serverGate = ServerGate();
  void _sendRequest(
    ProductDetailEventStart event,
    Emitter<ProductDetailStates> emit,
  ) async {
    emit(ProductDetailStateStart());
    CustomResponse response = await serverGate.sendToServer(
        url: "client/Product", body: event.inputData!.toJson());
    if (response.success && response.response!.data["success"] == true) {
      ProductDetailModel.fromJson(response.response!.data);
      emit(ProductDetailStateSuccess());
    } else if (response.success && response.response!.data["success"] == false) {
      emit(ProductDetailStateFailed(
        errType: 422,
        msg: response.response!.data["message"],
      ));
    } else {
      emit(ProductDetailStateFailed(
        errType: response.errType,
        msg: response.msg,
      ));
    }
  }
}

