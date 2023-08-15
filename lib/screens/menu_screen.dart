import 'package:firebase_app/screens/add_user_screen.dart';
import 'package:firebase_app/screens/view_users_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _onTapAddUserBtn(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AddUserScreen()));
  }

  void _onTapViewUsersBtn(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => const ViewUsersScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onTapAddUserBtn(context);
              },
              child: const Text("Add User"),
            ),
            ElevatedButton(
              onPressed: () {
                _onTapViewUsersBtn(context);
              },
              child: const Text("View Users"),
            ),
          ],
        ),
      ),
    );
  }
}
