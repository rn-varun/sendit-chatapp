import 'package:chat_app/components/TextField.dart';
import 'package:chat_app/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    void login() async {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        if (context.mounted) Navigator.pop(context);
        print('logged in');
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.code),
                ));
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // logo
              Center(
                  child: Icon(
                Icons.check,
                size: 75,
              )),
              //title
              Center(
                child: Text(
                  'S E N D I T',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // getEmail field
              MyTextField(
                obscureText: false,
                hintText: 'Email or Username',
                controller: emailController,
              ),

              SizedBox(
                height: 20,
              ),
              // getPass field
              MyTextField(
                obscureText: true,
                hintText: 'Password',
                controller: passController,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 10,
              ),
              // login button

              CustomButton(
                text: 'Login',
                onTap: login,
              ),

              SizedBox(
                height: 10,
              ),
              // dont have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
