import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_uk/pages/hovercard.dart';
import 'package:explore_uk/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

//logout function code
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    }
  }

  int selectedIndex = 0;
// navigation bar button function for logout
  void onItemTapped(int index) {
    if (index == 3) {
      signout();
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

// widget created for carousal bar
  Widget _carousalImage(String imagePath) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xFF00BF6D),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Explore Places',
          style: GoogleFonts.getFont('Roboto Condensed',
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          color: Color(0xFF00BF6D),
          child: Form(
              child: TextFormField(
            autofocus: true,
            textInputAction: TextInputAction.search,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                // ignore: deprecated_member_use
                color: Color(0xFF1D1D35).withOpacity(0.64),
              ),
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 12.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          )),
        ),
        SizedBox(height: 5),
        Column(
          children: [
            CarouselSlider(
                items: [
                  _carousalImage('assets/images/yana-745780.jpg'),
                  _carousalImage('assets/images/magod.jpg'),
                  _carousalImage('assets/images/sathodi1.jpg'),
                  _carousalImage('assets/images/forest.jpg')
                ],
                options: CarouselOptions(
                    height: 180.0, enlargeCenterPage: true, autoPlay: true))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GlassHover(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'map'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'logout'),
        ],
        backgroundColor: Color(0xFF00BF6D),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    );
  }
}
