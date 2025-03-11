import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/mirjan_bottom.dart';
import 'package:flutter/material.dart';

class Mirjan extends StatefulWidget {
  const Mirjan({super.key});

  @override
  State<Mirjan> createState() => _MirjanState();
}

class _MirjanState extends State<Mirjan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mir1.jpg'),
          fit: BoxFit.cover,
          // opacity: 0.9,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(115), child: CardAppBar()),
        bottomNavigationBar: MirjanBottom(),
      ),
    );
  }
}
