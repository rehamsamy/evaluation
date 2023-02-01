class ProductDetailModel {
  ProductDetailModel({
      this.success, 
      this.message, 
      this.data,});

  ProductDetailModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.category, 
      this.description, 
      this.image, 
      this.price, 
      this.oldprice, 
      this.favourite, 
      this.discount, 
      this.priceAfterDiscount, 
      this.moreImage, 
      this.color,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    oldprice = json['oldprice'];
    favourite = json['favourite'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    if (json['MoreImage'] != null) {
      moreImage = [];
      json['MoreImage'].forEach((v) {
        moreImage?.add(MoreImage.fromJson(v));
      });
    }
    if (json['Color'] != null) {
      color = [];
      json['Color'].forEach((v) {
        color?.add(Color.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? category;
  String? description;
  String? image;
  int? price;
  int? oldprice;
  int? favourite;
  int? discount;
  int? priceAfterDiscount;
  List<MoreImage>? moreImage;
  List<Color>? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['description'] = description;
    map['image'] = image;
    map['price'] = price;
    map['oldprice'] = oldprice;
    map['favourite'] = favourite;
    map['discount'] = discount;
    map['price_after_discount'] = priceAfterDiscount;
    if (moreImage != null) {
      map['MoreImage'] = moreImage?.map((v) => v.toJson()).toList();
    }
    if (color != null) {
      map['Color'] = color?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Color {
  Color({
      this.id, 
      this.name, 
      this.hex, 
      this.size,});

  Color.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    hex = json['hex'];
    if (json['Size'] != null) {
      size = [];
      json['Size'].forEach((v) {
        size?.add(Size.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? hex;
  List<Size>? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['hex'] = hex;
    if (size != null) {
      map['Size'] = size?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Size {
  Size({
      this.id, 
      this.name,});

  Size.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class MoreImage {
  MoreImage({
      this.id, 
      this.image, 
      this.hex,});

  MoreImage.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    hex = json['hex'];
  }
  int? id;
  String? image;
  String? hex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['hex'] = hex;
    return map;
  }

}