// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_types_as_parameter_names, non_constant_identifier_names, unused_local_variable, dead_code

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remainder_app/components/drawer.dart';
import 'package:firebase_remainder_app/utils/utils.dart';
import 'package:flutter/material.dart';

class TestingAddPage extends StatefulWidget {
  const TestingAddPage({super.key});

  @override
  State<TestingAddPage> createState() => _TestingAddPageState();
}

class _TestingAddPageState extends State<TestingAddPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    bool _isPasswordVisible = false;
    final dbRef = FirebaseDatabase.instance.ref('users');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Page'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 32),

          // Welcome Text
          const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 24),

          ElevatedButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                dbRef.child(id).set({
                  'id': id,
                  'email': _emailController.text,
                  'password': _passwordController.text
                }).then((value) {
                  Utils.successMessage('User submitted successfully', context);
                }).onError((err, StackTrace) {
                  Utils.errorMessage('Error submitting user', context);
                });
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
