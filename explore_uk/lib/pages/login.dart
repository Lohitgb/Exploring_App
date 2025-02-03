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
  String email = "", password = "";

  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool isloading = false;

  signIn() async {
    setState(() {
      isloading = true;
    });
    //error handling part using firebase auth exception and snackbar
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
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

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 206, 238, 223),
            // appBar: AppBar(
            //   centerTitle: true,
            //   title: Text(
            //     'Login',
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   backgroundColor: Colors.greenAccent,

            // ),
            body: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/sathodi.jpg',
                      fit: BoxFit.values[6],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 30.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: mailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf), fontSize: 18)),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color(0xFFedf0f8),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf), fontSize: 18)),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              email = mailController.text;
                              password = passwordController.text;
                            });
                            signIn();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 30.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF273671),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () => Forgot(),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Color(0xFF8c8e98),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'or Login with',
                    style: TextStyle(
                        color: Color(0xFF8c8e98),
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image(
                          image: AssetImage(
                            'assets/images/google.png',
                          ),
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/apple.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account??",
                        style: TextStyle(
                            color: Color(0xFF8c8e98),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () => Signup(),
                        child: Text(
                          '  '
                          'Signup',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF273671),
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
