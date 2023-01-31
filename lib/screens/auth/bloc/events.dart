import 'package:evaluation/screens/auth/bloc/input_data.dart';

class LoginEvents {}

class LoginEventStart extends LoginEvents {
  LoginInputData? inputData;
  LoginEventStart(this.inputData);

}

class RegisterEvents {}

class RegisterEventStart extends RegisterEvents {
  RegisterInputData? inputData;
  RegisterEventStart(this.inputData);

}
