import 'dart:convert';

class ProductModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? desc;
  int? catId;

  // Constructor
  ProductModel({this.id, this.name, this.price, this.img, this.desc, this.catId});

  // Named constructor from JSON
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    desc = json['desc'];
    catId = json['catId'];
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    data['desc'] = desc;
    data['catId'] = catId;
    return data;
  }
}
