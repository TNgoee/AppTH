import 'package:btbuoi1/data/model/categorymodel.dart';
import 'package:btbuoi1/data/model/productmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'base_database_helper.dart';

class SqfliteDatabaseHelper extends BaseDatabaseHelper {
  static final SqfliteDatabaseHelper _instance = SqfliteDatabaseHelper._internal();
  factory SqfliteDatabaseHelper() => _instance;
  SqfliteDatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'db_product.db');
    // Đã thay đổi: Tăng version từ 1 lên 2 và thêm onUpgrade
    _database = await openDatabase(
      path,
      version: 2, // <--- Tăng phiên bản database lên 2
      onCreate: _onCreate,
      onUpgrade: _onUpgrade, // <--- Thêm callback onUpgrade
    );
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE category(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        desc TEXT
      )
    ''');
    // Nếu  muốn bảng product cũng được tạo ngay từ đầu
    // trong trường hợp người dùng cài đặt ứng dụng lần đầu với phiên bản 2,
    // thì thêm vào đây.
    await db.execute('''
      CREATE TABLE product(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price INTEGER,
        img TEXT,
        desc TEXT,
        catId INTEGER,
        FOREIGN KEY (catId) REFERENCES category(id) ON DELETE CASCADE
      )
    ''');
  }

  // Hàm onUpgrade: Chạy khi phiên bản database cũ nhỏ hơn phiên bản mới
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('Upgrading database from version $oldVersion to $newVersion');
    if (oldVersion < 2) {
      // Logic migration từ phiên bản 1 lên phiên bản 2
      // Thêm bảng 'product'
      await db.execute('''
        CREATE TABLE product(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price INTEGER,
          img TEXT,
          desc TEXT,
          catId INTEGER,
          FOREIGN KEY (catId) REFERENCES category(id) ON DELETE CASCADE
        )
      ''');
      print('Table "product" created during upgrade.');
    }
    // Nếu có các phiên bản sau này (ví dụ: oldVersion < 3), bạn sẽ thêm các if block khác ở đây
    // if (oldVersion < 3) {
    //   // Thực hiện migration cho phiên bản 3
    // }
  }

  // Category CRUD
  @override
  Future<void> insertCategory(CategoryModel category) async {
    final db = await database;
    await db.insert('category', category.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<CategoryModel>> categories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('category');
    return maps.map((map) => CategoryModel.fromMap(map)).toList();
  }

  @override
  Future<CategoryModel> category(int id) async {
    final db = await database;
    final map = (await db.query('category', where: 'id = ?', whereArgs: [id])).first;
    return CategoryModel.fromMap(map);
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    final db = await database;
    await db.update('category', category.toMap(), where: 'id = ?', whereArgs: [category.id]);
  }

  @override
  Future<void> deleteCategory(int id) async {
    final db = await database;
    await db.delete('category', where: 'id = ?', whereArgs: [id]);
  }

  // Product CRUD
  @override
  Future<void> insertProduct(ProductModel product) async {
    final db = await database;
    await db.insert('product', product.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<ProductModel>> products() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('product');
    return maps.map((map) => ProductModel.fromMap(map)).toList();
  }

  @override
  Future<ProductModel> product(int id) async {
    final db = await database;
    final map = (await db.query('product', where: 'id = ?', whereArgs: [id])).first;
    return ProductModel.fromMap(map);
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final db = await database;
    await db.update('product', product.toMap(), where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }
}
