class User {
  String? name, userType, email;
  User({this.name, this.userType, this.email});
  factory User.getUser(userType) {
    if (userType == "client") {
      return Client();
    } else {
      return Provider();
    }
  }
}

class Client extends User {}

class Provider extends User {}
