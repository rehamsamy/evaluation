import 'package:evaluation/helpers/core_classes/server_gate.dart';
import 'package:evaluation/screens/auth/bloc/events.dart';
import 'package:evaluation/screens/auth/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginStateStart()) {
    on<LoginEventStart>(_sendRequest);
  }
  ServerGate serverGate = ServerGate();
  void _sendRequest(
    LoginEventStart event,
    Emitter<LoginStates> emit,
  ) async {
    emit(LoginStateStart());
    CustomResponse response = await serverGate.sendToServer(
        url: "login", body: event.inputData!.toJson());
    if (response.success && response.response!.data["error"] == false) {
      emit(LoginStateSuccess());
    } else if (response.success && response.response!.data["error"] == true) {
      emit(LoginStateFailed(
        errType: 422,
        msg: response.response!.data["message"],
      ));
    } else {
      emit(LoginStateFailed(
        errType: response.errType,
        msg: response.msg,
      ));
    }
  }
}


class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(RegisterStateStart()) {
    on<RegisterEventStart>(_sendRequest);
  }
  ServerGate serverGate = ServerGate();
  void _sendRequest(
      RegisterEventStart event,
      Emitter<RegisterStates> emit,
      ) async {
    emit(RegisterStateStart());
    CustomResponse response = await serverGate.sendToServer(
        url: "register", body: event.inputData!.toJson());
    if (response.success && response.response!.data["error"] == false) {
      emit(RegisterStateSuccess());
    } else if (response.success && response.response!.data["error"] == true) {
      emit(RegisterStateFailed(
        errType: 422,
        msg: response.response!.data["message"],
      ));
    } else {
      emit(RegisterStateFailed(
        errType: response.errType,
        msg: response.msg,
      ));
    }
  }
}
