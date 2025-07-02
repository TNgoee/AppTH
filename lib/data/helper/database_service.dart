// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'base_database_helper.dart';
// import 'sembast_database_helper.dart';
// import 'sqflite_database_helper.dart';

// class DatabaseService {
//   static late final BaseDatabaseHelper instance;

//   static Future<void> init() async {
//     if (kIsWeb) {
//       final sembastHelper = SembastDatabaseHelper();
//       await sembastHelper.init();
//       instance = sembastHelper;
//     } else {
//       instance = SqfliteDatabaseHelper();
//     }
//   }
// }
