import 'package:chat_app/auth/auth.dart';
import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/theme/dark_theme.dart';
import 'package:chat_app/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      
    );
  }
}