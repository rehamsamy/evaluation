/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"id":125,"name":"Test","mobile":"000114","email":"test191919190@test.com","image":"","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDM4ZTI5YTQxNzQ0MGJlN2M0NmExM2UyYzFkYjAyMTA0YjA1MTU4ZTNmMzI2OTAwZTNmMWYxNmUxNTc2OTllZjFlNjdhYjZkZmRhZGFmZGEiLCJpYXQiOjE2NzUxODA3NjAsIm5iZiI6MTY3NTE4MDc2MCwiZXhwIjoxNzA2NzE2NzYwLCJzdWIiOiIxMjUiLCJzY29wZXMiOltdfQ.pCqhZlgiWTdixQpCbTw7mEgsjVQsLIkD4R8RG44W-hXNzjoFYrFuz1T4mIa6NBvQeKQj1vwvkE7RaSdVYERD5GDCLwDoV4_YVujDOM7rZQ_bftqYiDcckFFlTvS9jSCK6sQD-a74H5sQnRsBF_ID6M9n3_M-jue2OxtJG8k3DYjTIxJQ2DQwjQHPONweENnzBamo71tqveNcBZNb2uaskR8EnnKuq26PRExHf_9diav-ZUIXUMAYYktQy4saYLDgqfx5UMeuKJeyGVUyIA_uHe15LU8xYUj9T3O6MQ-uaJAsFmpBpoSnaRbOe1xpar3I7gLmjx55rBgQz6GCKrB3WVkoGpZFBpysVqTeG-PsRpc2fb5rNokh_F7f0tii8xsMCyybSn04V0fyiqzkIw7G6rETdiZftPWWiM3GTPUNuCL2prtvVtWWjwEqiWjQEAbKjD15PoJ8Ky0WzRPn5BAVjQnYmy5E1oeK1hg9En3MiPmzj4AR8TxlvtPDz-TZO9pprvN4GLS8sytoekrib9PPbfDyrY5FNVsl7jLlLebg5o6sv_8y5NwVs0kt3iCp7FDsz6yRTThqspx33E__BQxd9SdTjT2hN16U32Ncna_vi7_Qk-uqohZzj5NUBvfM9fE0geeXKvt8-9Z1NL6C0AVyv2EEjCSl_ZC4a53CDpX_uc8"}

class LoginModel {
  LoginModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
LoginModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => LoginModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 125
/// name : "Test"
/// mobile : "000114"
/// email : "test191919190@test.com"
/// image : ""
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDM4ZTI5YTQxNzQ0MGJlN2M0NmExM2UyYzFkYjAyMTA0YjA1MTU4ZTNmMzI2OTAwZTNmMWYxNmUxNTc2OTllZjFlNjdhYjZkZmRhZGFmZGEiLCJpYXQiOjE2NzUxODA3NjAsIm5iZiI6MTY3NTE4MDc2MCwiZXhwIjoxNzA2NzE2NzYwLCJzdWIiOiIxMjUiLCJzY29wZXMiOltdfQ.pCqhZlgiWTdixQpCbTw7mEgsjVQsLIkD4R8RG44W-hXNzjoFYrFuz1T4mIa6NBvQeKQj1vwvkE7RaSdVYERD5GDCLwDoV4_YVujDOM7rZQ_bftqYiDcckFFlTvS9jSCK6sQD-a74H5sQnRsBF_ID6M9n3_M-jue2OxtJG8k3DYjTIxJQ2DQwjQHPONweENnzBamo71tqveNcBZNb2uaskR8EnnKuq26PRExHf_9diav-ZUIXUMAYYktQy4saYLDgqfx5UMeuKJeyGVUyIA_uHe15LU8xYUj9T3O6MQ-uaJAsFmpBpoSnaRbOe1xpar3I7gLmjx55rBgQz6GCKrB3WVkoGpZFBpysVqTeG-PsRpc2fb5rNokh_F7f0tii8xsMCyybSn04V0fyiqzkIw7G6rETdiZftPWWiM3GTPUNuCL2prtvVtWWjwEqiWjQEAbKjD15PoJ8Ky0WzRPn5BAVjQnYmy5E1oeK1hg9En3MiPmzj4AR8TxlvtPDz-TZO9pprvN4GLS8sytoekrib9PPbfDyrY5FNVsl7jLlLebg5o6sv_8y5NwVs0kt3iCp7FDsz6yRTThqspx33E__BQxd9SdTjT2hN16U32Ncna_vi7_Qk-uqohZzj5NUBvfM9fE0geeXKvt8-9Z1NL6C0AVyv2EEjCSl_ZC4a53CDpX_uc8"

class Data {
  Data({
      num? id, 
      String? name, 
      String? mobile, 
      String? email, 
      String? image, 
      String? token,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _image = image;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _image = json['image'];
    _token = json['token'];
  }
  num? _id;
  String? _name;
  String? _mobile;
  String? _email;
  String? _image;
  String? _token;
Data copyWith({  num? id,
  String? name,
  String? mobile,
  String? email,
  String? image,
  String? token,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  image: image ?? _image,
  token: token ?? _token,
);
  num? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get image => _image;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['image'] = _image;
    map['token'] = _token;
    return map;
  }

}