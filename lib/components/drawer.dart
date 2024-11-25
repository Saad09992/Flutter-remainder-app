// ignore_for_file: prefer_const_constructors

import 'package:firebase_remainder_app/controllers/auth_controller.dart';
import 'package:firebase_remainder_app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import '../utils/routes/routes_name.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDarkMode ? Colors.white : const Color.fromARGB(221, 46, 43, 43);

    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SizedBox(
              width: double.infinity, // Ensures content spans the drawer width
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => Text(
                        authController.currentUser?.email ?? 'Guest User',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                if (authController.isAuthenticated)
                  _buildDrawerItem(
                      context, RoutesName.home, 'Home', Icons.home, textColor),
                if (authController.isAuthenticated)
                  _buildDrawerItem(context, RoutesName.testing, 'Testing',
                      Icons.construction, textColor)
                else if (!authController.isAuthenticated)
                  _buildDrawerItem(context, RoutesName.signup, 'Sign Up',
                      Icons.person, textColor),
                if (!authController.isAuthenticated)
                  _buildDrawerItem(context, RoutesName.signin, 'Sign In',
                      Icons.login, textColor),
              ],
            ),
          ),
          if (authController.isAuthenticated)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await authController.signOut(context);
                    },
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String route, String title,
      IconData icon, Color textColor) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: textColor,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
