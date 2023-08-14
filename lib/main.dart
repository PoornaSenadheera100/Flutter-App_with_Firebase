import 'package:firebase_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
