import 'package:firebase_app/screens/add_user_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void onTapAddUserBtn(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AddUserScreen()));
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
                onTapAddUserBtn(context);
              },
              child: const Text("Add User"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("View Users"),
            ),
          ],
        ),
      ),
    );
  }
}
