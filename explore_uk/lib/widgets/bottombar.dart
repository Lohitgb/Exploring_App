import 'package:explore_uk/pages/city.dart';
import 'package:explore_uk/pages/fav.dart';
import 'package:explore_uk/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:explore_uk/pages/home.dart';
import 'package:explore_uk/pages/profile.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  const BottomBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  void _navigateTo(int index) {
    if (currentIndex == index) return;

    Widget destination;
    switch (index) {
      case 0:
        destination = ProfileScreen(
          selectedIndex: 0,
        );
        break;
      case 1:
        destination = FavoritePage(
          selectedIndex: 1,
        );
        break;
      case 2:
        destination = HomePage(
          selectedIndex: 2,
        );
        break;
      case 3:
        destination = CityPage(
          selectedIndex: 3,
        );
        break;
      case 4:
        destination = MenuPage(
          selectedIndex: 4,
        );
        break;
      default:
        destination = HomePage(selectedIndex: 2);
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => destination), // ✅ Removed ()
      (route) => false,
    );

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: BottomAppBar(
        color: Color(0xFF00BF6D),
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  icon: Icons.person_2_outlined,
                  selected: currentIndex == 0,
                  onPressed: () => _navigateTo(0),
                ),
                IconBottomBar(
                  icon: Icons.favorite,
                  selected: currentIndex == 1,
                  onPressed: () => _navigateTo(1),
                ),
                IconBottomBar2(
                  icon: Icons.home,
                  selected: currentIndex == 2,
                  onPressed: () => _navigateTo(2),
                ),
                IconBottomBar(
                  icon: Icons.location_city_outlined,
                  selected: currentIndex == 3,
                  onPressed: () => _navigateTo(3),
                ),
                IconBottomBar(
                  icon: Icons.list,
                  selected: currentIndex == 4,
                  onPressed: () => _navigateTo(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color primaryColor = const Color(0xff4338CA);

  const IconBottomBar({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 25,
        color: selected
            ? (icon == Icons.favorite ? Colors.red : Color(0xff4338CA))
            : Colors.white,
      ),
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color primaryColor = const Color(0xff4338CA);

  const IconBottomBar2({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
