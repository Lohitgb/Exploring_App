import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();

  Forgot() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'email'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: (() => Forgot()), child: Text('forgot password'))
          ],
        ),
      ),
    );
  }
}
