import 'package:btbuoi1/models/user.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    TextStyle mystyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Fullname: ${user.fullname ?? 'N/A'}", style: mystyle),
            Text("Email: ${user.email ?? 'N/A'}", style: mystyle),
            Text("Gender: ${user.gender ?? 'N/A'}", style: mystyle),
            Text("Favorite: ${user.favorite ?? 'N/A'}", style: mystyle),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
