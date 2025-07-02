import 'dart:convert';
import 'package:flutter/material.dart';
import '../../data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterWidget> {
  bool _checkValue1 = false;
  bool _checkValue2 = false;
  bool _checkValue3 = false;
  int _gender = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  getUser() {
    var fullName = _nameController.text;
    var email = _emailController.text;
    var gendername = 'None';
    if (_gender == 1) {
      gendername = "Male";
    } else if (_gender == 2) {
      gendername = "Female";
    } else if (_gender == 3) {
      gendername = "Other";
    }
    var favoriteName = '';
    if (_checkValue1) {
      favoriteName += "Music, ";
    }
    if (_checkValue2) {
      favoriteName += "Movie, ";
    }
    if (_checkValue3) {
      favoriteName += "Book, ";
    }
    if (favoriteName != "") {
      favoriteName = favoriteName.substring(0, favoriteName.length - 2);
    }
    var objUser = User(fullname: fullName, email: email, gender: gendername, favorite: favoriteName);
    return objUser;
  }

  Future<bool> saveUser(User objUser) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String strUser = jsonEncode(objUser);
      prefs.setString('user', strUser);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(alignment: Alignment.center, child: const Text('User information', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue))),
                  TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Full name', icon: Icon(Icons.person))),
                  const SizedBox(height: 15),
                  TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email', icon: Icon(Icons.email))),
                  const SizedBox(height: 15),
                  TextFormField(controller: _passController, decoration: const InputDecoration(labelText: 'Password', icon: Icon(Icons.password))),
                  const SizedBox(height: 15),
                  TextFormField(controller: _confirmPassController, decoration: const InputDecoration(labelText: 'Confirm password', icon: Icon(Icons.password))),
                  const SizedBox(height: 15),
                  const Text('What is your Gender?'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: const Text('Male'),
                          leading: Transform.translate(
                            offset: const Offset(-8, 0),
                            child: Radio(
                              groupValue: _gender,
                              value: 1,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: const Text('Female'),
                          leading: Transform.translate(
                            offset: const Offset(-8, 0),
                            child: Radio(
                              groupValue: _gender,
                              value: 2,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: const Text('Other'),
                          leading: Transform.translate(
                            offset: const Offset(-8, 0),
                            child: Radio(
                              groupValue: _gender,
                              value: 3,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('What is your favorite?'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.all(0),
                          title: const Text('Music'),
                          value: _checkValue1,
                          onChanged: (value) {
                            setState(() {
                              _checkValue1 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.all(0),
                          title: const Text('Movie'),
                          value: _checkValue2,
                          onChanged: (value) {
                            setState(() {
                              _checkValue2 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.all(0),
                          title: const Text('Book'),
                          value: _checkValue3,
                          onChanged: (value) {
                            setState(() {
                              _checkValue3 = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            User objUser = getUser();
                            if (await saveUser(objUser)) {
                              print(objUser.toJson());
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(title: Text('Alert'), content: SingleChildScrollView(child: Text('Save successful')));
                                },
                              );
                            }
                          },
                          child: const Text("Register"),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Login'))),
                    ],
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
