import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  _UserInformationScreenState createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _studentName = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _gender = 'Male'; // Default gender
  List<String> _favorites = []; // List to store selected favorites

  // List of gender options
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  // List of favorite options
  final List<String> _favoriteOptions = ['Music', 'Movie', 'Book'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful widget'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('User Information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue))),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.person), labelText: 'Student Name', border: OutlineInputBorder()),
                onChanged: (value) => setState(() => _studentName = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.email), labelText: 'Email', border: OutlineInputBorder()),
                onChanged: (value) => setState(() => _email = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
                onChanged: (value) => setState(() => _password = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), labelText: 'Confirm password', border: OutlineInputBorder()),
                obscureText: true,
                onChanged: (value) => setState(() => _confirmPassword = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm password';
                  }
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('What is your Gender?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children:
                    _genderOptions.map((gender) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: gender,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          Text(gender),
                        ],
                      );
                    }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('What is your Favorite?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children:
                    _favoriteOptions.map((favorite) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _favorites.contains(favorite),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  _favorites.add(favorite);
                                } else {
                                  _favorites.remove(favorite);
                                }
                              });
                            },
                          ),
                          Text(favorite),
                        ],
                      );
                    }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration Successful!')));
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text('Register'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Handle login logic here
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
