class LoginInputData {
  String? mobile;
  String? password;
  LoginInputData({this.mobile, this.password,});
  Map<String, dynamic> toJson() {
    return {
      "mobile": mobile,
      "password":password,
    };
  }
}


class RegisterInputData {
  String? mobile;
  String? password;
  String? confirmPassword;
  String? email;
  String? name;
  RegisterInputData({this.name,this.mobile,this.email, this.password,this.confirmPassword});
  Map<String, dynamic> toJson() {
    return {
      "mobile": mobile,
      "password":password,
      "name": name,
      "password_confirmation":confirmPassword,
      "email": email,

    };
  }
}
