import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool isloading = false;
  TextEditingController mailController = TextEditingController();

//Error handling code

// Forgot() async {
//     if (email.isEmpty) {
//       Get.snackbar('Error', 'Please enter your email',
//           backgroundColor: Colors.grey.withOpacity(0.5),
//           margin: EdgeInsets.all(30));
//       return;
//     }

//     setState(() {
//       isloading = true;
//     });

//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       Get.snackbar('Link Sent', 'A link has been sent to your Email',
//           backgroundColor: Colors.white.withOpacity(0.5),
//           margin: EdgeInsets.all(30));
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = 'Something went wrong';

//       if (e.code == 'user-not-found') {
//         errorMessage = 'No account found with this email';
//       } else if (e.code == 'invalid-email') {
//         errorMessage = 'Invalid email format';
//       }

//       Get.snackbar('Error', errorMessage,
//           backgroundColor: Colors.grey.withOpacity(0.5),
//           margin: EdgeInsets.all(30));
//     } catch (e) {
//       Get.snackbar('Error', 'An unexpected error occurred: $e',
//           backgroundColor: Colors.grey.withOpacity(0.5),
//           margin: EdgeInsets.all(30));
//     }

//     setState(() {
//       isloading = false;
//     });
//   }

  Forgot() async {
    setState(() {
      isloading = true;
    });
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((Value) => {
              Get.snackbar('Link Sent', 'A link has been sent to your Email',
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.5),
                  margin: EdgeInsets.all(30)),
            });
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
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
              // ignore: deprecated_member_use
              child: Container(color: Colors.white.withOpacity(0.1)),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(width * 0.05),
                margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                width: width < 500 ? double.infinity : 400,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  // ignore: deprecated_member_use
                  boxShadow: [
                    BoxShadow(
                        // ignore: deprecated_member_use
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
                        "Forgot Password",
                        style: GoogleFonts.getFont("Roboto Condensed",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      buildInputField(mailController, 'Email'),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = mailController.text;
                              mailController.clear();
                            });
                            Forgot();
                          }
                        },
                        child:
                            buildButton('Forgot Password', Colors.blue[600]!),
                      ),
                      SizedBox(height: 15),
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
