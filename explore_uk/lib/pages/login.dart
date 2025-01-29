import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(onPressed: (() => signIn()), child: Text('Login'))
        ],
      ),
    );
  }
}
