import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home', style: TextStyle(
      ),), actions: [
        IconButton(onPressed: logout, icon: const Icon(Icons.logout))
      ],
      backgroundColor: Color(0xff3A3E3B)
      ),
      body: Center(child: Text('Under Construction'),),
    );
  }
}