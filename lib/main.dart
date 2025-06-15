import 'package:btbuoi1/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'data/helper/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.init(); // Khởi tạo database
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Mainpage());
  }
}
