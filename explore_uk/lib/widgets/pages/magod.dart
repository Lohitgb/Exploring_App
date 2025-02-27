import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/post_bottom_bar.dart';
import 'package:flutter/material.dart';

class MagodPage extends StatefulWidget {
  const MagodPage({super.key});

  @override
  State<MagodPage> createState() => _MagodPageState();
}

class _MagodPageState extends State<MagodPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sathodi1.jpg'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(115), child: CardAppBar()),
          bottomNavigationBar: PostBottomBar(),
        ));
  }
}
