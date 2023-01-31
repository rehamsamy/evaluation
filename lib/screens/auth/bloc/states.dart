import 'login_model.dart';

class LoginStates {}

class LoginStateStart extends LoginStates {}

class LoginStateSuccess extends LoginStates {
  LoginModel? data;
  LoginStateSuccess({
    this.data,
  });
}

class LoginStateFailed extends LoginStates {
  String? msg;
  int? errType, statusCode;
  LoginStateFailed({this.msg, this.errType, this.statusCode});
}



class RegisterStates {}

class RegisterStateStart extends RegisterStates {}

class RegisterStateSuccess extends RegisterStates {
  LoginModel? data;
  RegisterStateSuccess({
    this.data,
  });
}

class RegisterStateFailed extends RegisterStates {
  String? msg;
  int? errType, statusCode;
  RegisterStateFailed({this.msg, this.errType, this.statusCode});
}
