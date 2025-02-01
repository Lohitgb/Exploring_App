// import 'dart:math';

import 'package:explore_uk/pages/forgot.dart';
import 'package:explore_uk/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading = false;

  signIn() async {
    setState(() {
      isloading = true;
    });
    //error handling part using firebase auth exception and snackbar
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Email nd password not matching !!', e.code,
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar('error msg', e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  // signIn() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;
  //   final creadential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //   await FirebaseAuth.instance.signInWithCredential(creadential);
  // }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                  ElevatedButton(
                      onPressed: (() => signIn()), child: Text('Login')),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: (() => Get.to(Signup())),
                      child: Text('signup')),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: (() => Get.to(Forgot())),
                      child: Text('send link')),
                  SizedBox(height: 15),
                ],
              ),
              // child: Center(
              //   child: ElevatedButton(
              //     onPressed: (() => signIn()),
              //     child: Text(
              //       'sign in with google',
              //       style: TextStyle(fontSize: 25),
              //     ),
              //   ),
              // ),
            ),
          );
  }
}
