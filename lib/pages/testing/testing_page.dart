// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_field, avoid_unnecessary_containers, avoid_print

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_remainder_app/components/drawer.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
import 'package:firebase_remainder_app/utils/utils.dart';
import 'package:flutter/material.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _filterController = TextEditingController();
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final dbRef = FirebaseDatabase.instance.ref('users');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Page'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _filterController,
              decoration: InputDecoration(
                  hintText: 'Filter', border: OutlineInputBorder()),
              onChanged: (String val) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: dbRef,
                defaultChild: Text("No users found"),
                itemBuilder: (context, snapshot, animation, index) {
                  final email = snapshot.child('email').value.toString();
                  final id = snapshot.child('id').value.toString();
                  if (_filterController.text.isEmpty) {
                    return ListTile(
                      title: Text(email),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () {
                                dbRef.child(id).remove().then((val) {
                                  Navigator.pop(context);
                                  Utils.successMessage(
                                      "$id deleted successfully", context);
                                }).onError((error, stackTrace) {
                                  Navigator.pop(context);
                                  Utils.errorMessage(
                                      "Failed to delete $id", context);
                                });
                              },
                              child: Text("Delete"),
                            ),
                          ),
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () {
                                _editingController.text = email;
                                showMyDialog(email, id);
                              },
                              child: Text("Update"),
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (email.toLowerCase().contains(
                      _filterController.text.toLowerCase().toString())) {
                    return ListTile(
                        title: Text(email),
                        trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: TextButton(
                                      onPressed: () {
                                        dbRef.child(id).remove().then((val) {
                                          Navigator.pop(context);
                                          Utils.successMessage(
                                              "$id deleted successfully",
                                              context);
                                        }).onError((error, stackTrace) {
                                          Navigator.pop(context);
                                          Utils.errorMessage(
                                              "Failed to delete $id", context);
                                        });
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: TextButton(
                                      onPressed: () {
                                        _editingController.text = email;
                                        showMyDialog(email, id);
                                      },
                                      child: Text("Update"),
                                    ),
                                  )
                                ]));
                  } else {
                    return Container();
                  }
                }),
          ),
          FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, RoutesName.testingAdd);
          })
        ],
      ),
    );
  }

  Future<void> showMyDialog(String email, String id) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                controller: _editingController,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    print(_editingController.text);
                    dbRef
                        .child(id)
                        .update({'email': _editingController.text}).then((val) {
                      Navigator.pop(context);
                      Utils.successMessage("Updated successfully", context);
                    }).onError((error, stackTrace) {
                      Utils.errorMessage('Failed to update', context);
                    });
                  },
                  child: Text("Submit")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ],
          );
        });
  }
}
