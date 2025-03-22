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
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    selectedIndex: 2,
                  )));
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/rain.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.white.withOpacity(0.1)),
          ),
          Center(
            // Centering the form
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Prevents unnecessary space
                  children: [
                    Text(
                      "Sign In",
                      style: GoogleFonts.getFont("Roboto Condensed",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    buildInputField(mailcontroller, 'Email'),
                    SizedBox(height: 15),
                    buildInputField(passwordController, 'Password',
                        obscureText: true),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = mailcontroller.text;
                            password = passwordController.text;
                          });
                          signIn();
                        }
                      },
                      child: buildButton('Sign In', Colors.blue[600]!),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Forgot()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.getFont('Roboto Condensed',
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'SignIn with',
                      style: GoogleFonts.getFont('Roboto Condensed',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF273671)),
                    ),
                    SizedBox(height: 10),
                    buildSocialButtons(),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.getFont('Roboto Condensed',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text(
                            'Create',
                            style: GoogleFonts.getFont("Roboto Condensed",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String hint,
      {bool obscureText = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Please enter $hint' : null,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xFFb2b7bf), fontSize: 15),
        ),
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.getFont("Roboto Condensed",
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialButton('assets/images/google.png'),
        SizedBox(width: 15),
        buildSocialButton('assets/images/apple.png'),
        SizedBox(width: 15),
        buildSocialButton('assets/images/insta.png'),
      ],
    );
  }

  Widget buildSocialButton(String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFedF0F8).withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(imagePath, height: 30, width: 25),
      ),
    );
  }
}
