import 'package:explore_uk/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  void initState() {
    sendverifylink();
    super.initState();
  }

  sendverifylink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((Value) => {
          Get.snackbar('Link Sent', 'A link has been sent to your email',
              margin: EdgeInsets.all(30), snackPosition: SnackPosition.BOTTOM)
        });
  }

  relod() async {
    await FirebaseAuth.instance.currentUser!
        .reload()
        .then((value) => {Get.offAll(Wrapper())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify email'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(45),
          child: Center(
            child: Text(
                'open your mail and click on the link provided to verify email & relod tis page'),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => relod()),
        child: Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}
