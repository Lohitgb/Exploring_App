import 'package:explore_uk/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.green[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.network(
              // 'https://lottie.host/6f5172ff-6d22-4647-96e1-d6b0ebe744ac/EsUbMGwwJw.json',
              'https://lottie.host/e220d3a3-1cc3-4e6f-9dfc-25f8bc335bfb/Q7SxW0uYkA.json',
              repeat: true,
              animate: true,
            ),
            Text(
              'Work in Progress',
              style: GoogleFonts.getFont('Roboto Condensed',
                  fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signout,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}
