import 'package:firebase_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuScreen(),
    );
  }
}
