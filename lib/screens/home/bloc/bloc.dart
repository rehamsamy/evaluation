import 'package:evaluation/helpers/core_classes/server_gate.dart';
import 'package:evaluation/screens/home/bloc/events.dart';
import 'package:evaluation/screens/home/bloc/product_model.dart';
import 'package:evaluation/screens/home/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  ProductBloc() : super(ProductStateStart()) {
    on<ProductEventStart>(_sendRequest);
  }
  ServerGate serverGate = ServerGate();
  void _sendRequest(
    ProductEventStart event,
    Emitter<ProductStates> emit,
  ) async {
    emit(ProductStateStart());
    CustomResponse response = await serverGate.sendToServer(
        url: "client/CategoryProduct", body: event.inputData!.toJson());
    if (response.success && response.response!.data["success"] == true) {
      ProductModel model=ProductModel.fromJson(response.response!.data);
      emit(ProductStateSuccess(data: model));
    } else if (response.success && response.response!.data["success"] == false) {
      emit(ProductStateFailed(
        errType: 422,
        msg: response.response!.data["message"],
      ));
    } else {
      emit(ProductStateFailed(
        errType: response.errType,
        msg: response.msg,
      ));
    }
  }
}

