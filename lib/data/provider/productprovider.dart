// import '../model/productmodel.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';

// class ReadData {
//   Future<List<Product>> loadData() async {
//     var data = await rootBundle.loadString("assets/files/productlist.json");
//     var dataJson = jsonDecode(data);

//     return (dataJson['data'] as List).map((e) => Product.fromJson(e)).toList();
//   }

//   Future<List<Product>> loadDataByCat(int catId) async {
//     var data = await rootBundle.loadString("assets/files/productlist.json");
//     var dataJson = jsonDecode(data);

//     List<Product> productList = (dataJson['data'] as List).map((e) => Product.fromJson(e)).toList();

//     return productList.where((product) => product.catId == catId).toList();
//   }
// }
