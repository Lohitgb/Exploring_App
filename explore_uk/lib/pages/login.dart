import 'package:explore_uk/pages/forgot.dart';
import 'package:explore_uk/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), backgroundColor: Colors.amber),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (() => signIn()), child: Text('Login')),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: (() => Get.to(Signup())), child: Text('signup')),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: (() => Get.to(Forgot())), child: Text('send link')),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
