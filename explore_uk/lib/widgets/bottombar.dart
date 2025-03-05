import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:explore_uk/pages/home.dart';
import 'package:explore_uk/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  const BottomBar({super.key, required this.selectedIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 2;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: currentIndex,
      items: [
        Icon(
          Icons.person_outline,
          size: 30,
        ),
        Icon(
          Icons.favorite_outline,
          size: 30,
        ),
        Icon(
          Icons.home,
          size: 30,
        ),
        Icon(
          Icons.location_city_outlined,
          size: 30,
        ),
        Icon(
          Icons.list,
          size: 30,
        )
      ],
      buttonBackgroundColor: Colors.green,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        if (index == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                        selectedIndex: index,
                      )));
        } else if (index == 2) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        selectedIndex: index,
                      )),
              (route) => false);
        }
      },
    );
  }
}
