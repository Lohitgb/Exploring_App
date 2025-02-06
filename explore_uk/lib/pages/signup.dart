// import 'package:explore_uk/pages/wrapper.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   Signup() async {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email.text, password: password.text);
//     Get.offAll(Wrapper());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('signup'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(children: [
//           TextField(
//             controller: email,
//             decoration: InputDecoration(hintText: 'email'),
//           ),
//           TextField(
//             controller: password,
//             decoration: InputDecoration(hintText: 'password'),
//           ),
//           SizedBox(height: 15),
//           ElevatedButton(onPressed: (() => Signup()), child: Text('signup'))
//         ]),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:explore_uk/pages/signin.dart';
import 'package:explore_uk/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  String email = '', password = '';

  bool isloading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Signup() async {
    setState(() {
      isloading = true;
    });
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/forest.jpg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(50),
            //   child: Container(
            //       // color: Colors.amberAccent,
            //       ),
            // ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(50, 200, 50, 200),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFedf0f8),
                                borderRadius: BorderRadius.circular(30)),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter email';
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf), fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFedf0f8),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Color(0xFFb2b7bf), fontSize: 18)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                email = emailController.text;
                                password = passwordController.text;
                              }
                              Signup();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.getFont('Roboto Condensed',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: GoogleFonts.getFont('Roboto Condensed',
                                    color: Color(0xFFedF0F8),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.getFont('Roboto Condensed',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // AuthMethods().signInWithGoogle(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFedF0F8),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/google.png',
                                        height: 30,
                                        width: 25,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'SignUpWithGoogle',
                                        style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //AuthMethods().signInMethods(conetxt);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFedF0F8),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/apple.png',
                                        height: 30,
                                        width: 25,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'SignUpWithApple',
                                        style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
//
