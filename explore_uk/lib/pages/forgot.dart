import 'dart:ui';

import 'package:explore_uk/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  String email = '';
  bool isloading = false;
  TextEditingController emailController = TextEditingController();

  Forgot() async {
    setState(() {
      isloading = true;
    });
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((Value) => {
              Get.snackbar('Link Sent', 'A link has been sent to your email',
                  backgroundColor: Colors.amber[100],
                  margin: EdgeInsets.all(30)),
            });
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/vibhooti-falls.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.1),
            ),
          ),

          //text heading code

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Align(
          //       alignment: Alignment.center,
          //       child: Text(
          //         'hello',
          //         style: TextStyle(fontSize: 52, color: Colors.amber),
          //       ),
          //     )
          //   ],
          // ),

          // old code for padding

          // Padding(
          // padding: EdgeInsets.fromLTRB(75, 150, 75, 150),
          // child: Container(
          // color: Colors.amberAccent,
          // ),
          // ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                // color: Colors.pink,
                padding: EdgeInsets.fromLTRB(50, 270, 50, 270),
                child: Form(
                    child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter Email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf), fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          email = emailController.text;
                        });
                        Forgot();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[600],
                        ),
                        child: Center(
                          child: Text(
                            'Forgot Password',
                            style: GoogleFonts.getFont('Roboto Condensed',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: GoogleFonts.getFont('Roboto Condensed',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text(
                            'create',
                            style: GoogleFonts.getFont('Roboto Condensed',
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    )
                  ],
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
