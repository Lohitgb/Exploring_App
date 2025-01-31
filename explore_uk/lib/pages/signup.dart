import 'package:explore_uk/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signup'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: 'email'),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(hintText: 'password'),
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: (() => Signup()), child: Text('signup'))
        ]),
      ),
    );
  }
}
