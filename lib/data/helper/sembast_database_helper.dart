// import 'package:btbuoi1/data/model/categorymodel.dart';
// import 'package:btbuoi1/data/model/productmodel.dart';
// import 'package:sembast/sembast.dart';
// import 'package:sembast_web/sembast_web.dart';
// import 'base_database_helper.dart';

// class SembastDatabaseHelper extends BaseDatabaseHelper {
//   static final SembastDatabaseHelper _instance = SembastDatabaseHelper._internal();
//   factory SembastDatabaseHelper() => _instance;
//   SembastDatabaseHelper._internal();

//   late final Database _db;

//   final _categoryStore = intMapStoreFactory.store('category');
//   final _productStore = intMapStoreFactory.store('product');

//   Future<void> init() async {
//     final factory = databaseFactoryWeb;
//     _db = await factory.openDatabase('db_product_web.db');
//   }

//   // Category
//   @override
//   Future<void> insertCategory(CategoryModel category) async {
//     await _categoryStore.add(_db, category.toMap());
//   }

//   @override
//   Future<List<CategoryModel>> categories() async {
//     final records = await _categoryStore.find(_db);
//     return records.map((e) => CategoryModel.fromMap(e.value)).toList();
//   }

//   @override
//   Future<CategoryModel> category(int id) async {
//     final record = await _categoryStore.record(id).get(_db);
//     return CategoryModel.fromMap(record!);
//   }

//   @override
//   Future<void> updateCategory(CategoryModel category) async {
//     await _categoryStore.record(category.id!).put(_db, category.toMap());
//   }

//   @override
//   Future<void> deleteCategory(int id) async {
//     await _categoryStore.record(id).delete(_db);
//   }

//   // Product
//   @override
//   Future<void> insertProduct(ProductModel product) async {
//     await _productStore.add(_db, product.toMap());
//   }

//   @override
//   Future<List<ProductModel>> products() async {
//     final records = await _productStore.find(_db);
//     return records.map((e) => ProductModel.fromMap(e.value)).toList();
//   }

//   @override
//   Future<ProductModel> product(int id) async {
//     final record = await _productStore.record(id).get(_db);
//     return ProductModel.fromMap(record!);
//   }

//   @override
//   Future<void> updateProduct(ProductModel product) async {
//     await _productStore.record(product.id!).put(_db, product.toMap());
//   }

//   @override
//   Future<void> deleteProduct(int id) async {
//     await _productStore.record(id).delete(_db);
//   }
// }
