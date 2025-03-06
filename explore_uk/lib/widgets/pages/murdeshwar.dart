import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/murdeshwar_bottom.dart';
import 'package:flutter/material.dart';

class MurdeshwarPage extends StatefulWidget {
  const MurdeshwarPage({super.key});

  @override
  State<MurdeshwarPage> createState() => MurdeshwarPageState();
}

class MurdeshwarPageState extends State<MurdeshwarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/mur1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(115), child: CardAppBar()),
        bottomNavigationBar: MurdeshwarBottom(),
      ),
    );
  }
}
