import 'dart:ui';

// import 'package:explore_uk/pages/auth.dart';
import 'package:explore_uk/pages/forgot.dart';
import 'package:explore_uk/pages/home.dart';
import 'package:explore_uk/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '', password = '';

  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool isloading = false;
  final _formkey = GlobalKey<FormState>();
  signIn() async {
    setState(() {
      isloading = true;
    });
    //error handling part using firebase auth exception and snackbar
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User not found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found that Email ',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Wrong password provided by user',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ));
      }
    } catch (e) {
      Get.snackbar('error msg', e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 241, 168),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/vibhooti-falls.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            // ignore: deprecated_member_use
            child: Container(color: Colors.white.withOpacity(0.1)),
          ),
          // Padding(
          //   padding: EdgeInsets.all(50),
          //   // child: Container(
          //   // color: Colors.amber,
          //   // ),
          // ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFedf0f8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please Enter Email';
                            }
                            return null;
                          },
                          controller: mailcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18)),
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
                            borderRadius: BorderRadius.circular(30.0)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18)),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              password = passwordController.text;
                            });
                          }
                          signIn();
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
                              'Sign In',
                              style: GoogleFonts.getFont("Roboto Condensed",
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgot()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.getFont('Roboto Condensed',
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Login with',
                        style: GoogleFonts.getFont('Roboto Condensed',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF273671)),
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
                                    'SignInWithGoogle',
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
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // AuthMethods().signInWithApple();
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
                                    'assets/images/apple.png',
                                    height: 30,
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'SignInWithApple',
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't have an account?",
                            style: GoogleFonts.getFont('Roboto Condensed',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF273671)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Signup())));
                            },
                            child: Text(
                              'create',
                              style: GoogleFonts.getFont("Roboto Condensed",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFedF0F8)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
