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

  TextEditingController mailController = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
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
                        offset: Offset(0, 5))
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.getFont("Roboto Condensed",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      buildInputField(mailController, 'Email'),
                      SizedBox(height: 15),
                      buildInputField(passwordController, 'Password',
                          obscureText: true),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = mailController.text;
                              password = passwordController.text;
                            });
                            Signup();
                          }
                        },
                        child: buildButton('Sign Up', Colors.blue[600]!),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Signup with',
                        style: GoogleFonts.getFont('Roboto Condensed',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF273671)),
                      ),
                      SizedBox(height: 15),
                      buildSocialButtons(),
                      SizedBox(height: 15),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: Divider(
                      //     color: Colors.white,
                      //     thickness: 1,
                      //   ),
                      // ),
                      // SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
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
                                      builder: (context) => SignIn()));
                            },
                            child: Text(
                              'Login',
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
            )
          ],
        ),
      ),
    );
  }
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
          color: Color(0xFFedF0F8).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30)),
      child: Image.asset(
        imagePath,
        height: 30,
        width: 25,
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
