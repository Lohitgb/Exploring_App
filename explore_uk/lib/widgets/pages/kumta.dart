import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/post_bottom_bar.dart';
import 'package:flutter/material.dart';

class Kumta extends StatefulWidget {
  const Kumta({super.key});

  @override
  State<Kumta> createState() => _KumtaState();
}

class _KumtaState extends State<Kumta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/forest.jpg'),
          fit: BoxFit.cover,
          // opacity: 0.9,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(115), child: CardAppBar()),
        bottomNavigationBar: PostBottomBar(),
      ),
    );
  }
}
