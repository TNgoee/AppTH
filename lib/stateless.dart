import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless widget'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80', // Placeholder URL for a tree in hand image
            fit: BoxFit.cover,
            height: 300,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text('Image failed to load'));
            },
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Build project by my hand!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
          ),
          const SizedBox(height: 10),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Text('Trần Thị Thảo Nguyên', style: TextStyle(fontSize: 16, color: Colors.grey))),
        ],
      ),
    );
  }
}
