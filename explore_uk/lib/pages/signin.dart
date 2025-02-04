import 'dart:ui';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '', password = '';

  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 241, 168),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/yana2.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.white.withOpacity(0.1)),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Container(
              width: 4,
              height: 4,
              color: Colors.amber,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(75, 100, 75, 100),
                child: Form(
                    child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: TextFormField(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
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
