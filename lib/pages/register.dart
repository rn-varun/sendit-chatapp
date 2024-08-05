import 'package:chat_app/components/TextField.dart';
import 'package:chat_app/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confPassController = TextEditingController();

    void registerUser() async {
      print("Register button clicked");
      // check passwords
      if (passController.text != confPassController.text) {
        print("Passwords don't match");
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Passwords Don\'t match'),
                ));
        return;
      }

      // register user
      else {
        try {
          UserCredential? userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text, password: passController.text);
          print("User registered successfully");
          Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
          print("Error: ${e.code}");
          // display error
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.code),
                  ));
        }
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
                height: 35,
              ),
              MyTextField(
                obscureText: false,
                hintText: 'Username',
                controller: userNameController,
              ),

              SizedBox(
                height: 15,
              ),
              MyTextField(
                obscureText: false,
                hintText: 'Email',
                controller: emailController,
              ),
              SizedBox(
                height: 15,
              ),
              // getPass field
              MyTextField(
                obscureText: true,
                hintText: 'Password',
                controller: passController,
              ),
              SizedBox(
                height: 15,
              ),
              MyTextField(
                obscureText: true,
                hintText: 'Confirm Password',
                controller: confPassController,
              ),
              // login button
              SizedBox(
                height: 25,
              ),

              CustomButton(
                text: 'Register',
                onTap: registerUser,
              ),

              // don't have an account?
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Here",
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
