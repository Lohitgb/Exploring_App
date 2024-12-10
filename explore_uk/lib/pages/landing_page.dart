import 'package:explore_uk/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 93, 23, 48),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('assets/images/tagore.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'UTTARA KANNADA',
                style: GoogleFonts.getFont('Kaushan Script',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              height: 1.3,
                              color: Colors.white),
                          children: [
                            TextSpan(text: 'Plan Your'),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: 'Luxurious Vacation',
                              style: GoogleFonts.getFont('Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 35,
                                  height: 1.3,
                                  color: Colors.white),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[500]),
                    child: Center(
                      child: Text(
                        'Explore',
                        style: GoogleFonts.getFont("Roboto Condensed",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
