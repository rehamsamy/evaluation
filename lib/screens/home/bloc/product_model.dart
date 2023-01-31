/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"id":1,"name":"افضل العروض","product":[{"id":23,"name":"فستان طويل - 7057","image":"https://caramellez2.b-cdn.net/product_images/products/1635115483.jpg","price":450,"oldprice":450},{"id":76,"name":"أفرول نسائي بدون رقبة - 7277","image":"https://caramellez2.b-cdn.net/product_images/products/1654721473.JPG","price":392,"oldprice":392},{"id":77,"name":"افرول شيفون  برقبة - 7204","image":"https://caramellez2.b-cdn.net/product_images/products/1654781410.JPG","price":441,"oldprice":441},{"id":78,"name":"افرول برقبة وكم طويل  للسهرات - 7231","image":"https://caramellez2.b-cdn.net/product_images/products/1654781697.JPG","price":392,"oldprice":392},{"id":80,"name":"فستان نسائي طويل للحفلات  - 7212","image":"https://caramellez2.b-cdn.net/product_images/products/1654782659.JPG","price":516,"oldprice":516},{"id":86,"name":"فستان  نسائي طويل بدون  رقبة وكتف للسهرت والحفلات -7213","image":"https://caramellez2.b-cdn.net/product_images/products/1654784793.JPG","price":355,"oldprice":355},{"id":88,"name":"فستان طويل للسهرات - 7236","image":"https://caramellez2.b-cdn.net/product_images/products/1654785147.JPG","price":1000,"oldprice":1000},{"id":89,"name":"فستان نسائي طويل للحفلات - 7237","image":"https://caramellez2.b-cdn.net/product_images/products/1654785428.JPG","price":478,"oldprice":478},{"id":90,"name":"أفرول طويل بدون رقبة كم قصير- 7227","image":"https://caramellez2.b-cdn.net/product_images/products/1654785757.JPG","price":355,"oldprice":355}]}

class ProductModel {
  ProductModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ProductModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
ProductModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => ProductModel(  success: success ?? _success,
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

/// id : 1
/// name : "افضل العروض"
/// product : [{"id":23,"name":"فستان طويل - 7057","image":"https://caramellez2.b-cdn.net/product_images/products/1635115483.jpg","price":450,"oldprice":450},{"id":76,"name":"أفرول نسائي بدون رقبة - 7277","image":"https://caramellez2.b-cdn.net/product_images/products/1654721473.JPG","price":392,"oldprice":392},{"id":77,"name":"افرول شيفون  برقبة - 7204","image":"https://caramellez2.b-cdn.net/product_images/products/1654781410.JPG","price":441,"oldprice":441},{"id":78,"name":"افرول برقبة وكم طويل  للسهرات - 7231","image":"https://caramellez2.b-cdn.net/product_images/products/1654781697.JPG","price":392,"oldprice":392},{"id":80,"name":"فستان نسائي طويل للحفلات  - 7212","image":"https://caramellez2.b-cdn.net/product_images/products/1654782659.JPG","price":516,"oldprice":516},{"id":86,"name":"فستان  نسائي طويل بدون  رقبة وكتف للسهرت والحفلات -7213","image":"https://caramellez2.b-cdn.net/product_images/products/1654784793.JPG","price":355,"oldprice":355},{"id":88,"name":"فستان طويل للسهرات - 7236","image":"https://caramellez2.b-cdn.net/product_images/products/1654785147.JPG","price":1000,"oldprice":1000},{"id":89,"name":"فستان نسائي طويل للحفلات - 7237","image":"https://caramellez2.b-cdn.net/product_images/products/1654785428.JPG","price":478,"oldprice":478},{"id":90,"name":"أفرول طويل بدون رقبة كم قصير- 7227","image":"https://caramellez2.b-cdn.net/product_images/products/1654785757.JPG","price":355,"oldprice":355}]

class Data {
  Data({
      num? id, 
      String? name, 
      List<Product>? product,}){
    _id = id;
    _name = name;
    _product = product;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['product'] != null) {
      _product = [];
      json['product'].forEach((v) {
        _product?.add(Product.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  List<Product>? _product;
Data copyWith({  num? id,
  String? name,
  List<Product>? product,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  product: product ?? _product,
);
  num? get id => _id;
  String? get name => _name;
  List<Product>? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_product != null) {
      map['product'] = _product?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 23
/// name : "فستان طويل - 7057"
/// image : "https://caramellez2.b-cdn.net/product_images/products/1635115483.jpg"
/// price : 450
/// oldprice : 450

class Product {
  Product({
      num? id, 
      String? name, 
      String? image, 
      num? price, 
      num? oldprice,}){
    _id = id;
    _name = name;
    _image = image;
    _price = price;
    _oldprice = oldprice;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _price = json['price'];
    _oldprice = json['oldprice'];
  }
  num? _id;
  String? _name;
  String? _image;
  num? _price;
  num? _oldprice;
Product copyWith({  num? id,
  String? name,
  String? image,
  num? price,
  num? oldprice,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  price: price ?? _price,
  oldprice: oldprice ?? _oldprice,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  num? get price => _price;
  num? get oldprice => _oldprice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['price'] = _price;
    map['oldprice'] = _oldprice;
    return map;
  }

}