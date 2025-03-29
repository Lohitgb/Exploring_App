import 'package:explore_uk/pages/navigation/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalukNavigation extends StatefulWidget {
  final Widget child;
  const TalukNavigation({super.key, required this.child});

  @override
  State<TalukNavigation> createState() => _TalukNavigationState();
}

class _TalukNavigationState extends State<TalukNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 25, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Find Your\nBest Places',
              style: GoogleFonts.getFont('Roboto Condensed',
                  fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: BottomBar(selectedIndex: 2),
    );
  }
}
