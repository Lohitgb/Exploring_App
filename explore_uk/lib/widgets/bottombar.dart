import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
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
    );
  }
}
