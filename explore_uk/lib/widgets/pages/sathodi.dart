import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/sathodi_bottom.dart';
import 'package:flutter/material.dart';

class Sathodi extends StatefulWidget {
  const Sathodi({super.key});

  @override
  State<Sathodi> createState() => _SathodiState();
}

class _SathodiState extends State<Sathodi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sathodi3.jpg'),
          fit: BoxFit.cover,
          // opacity: 0.9,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(115), child: CardAppBar()),
        bottomNavigationBar: SathodiBottom(),
      ),
    );
  }
}
