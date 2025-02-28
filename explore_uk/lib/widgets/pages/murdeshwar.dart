import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/murdeshwar_bottom.dart';
import 'package:flutter/material.dart';

class MurdeshwarPgae extends StatefulWidget {
  const MurdeshwarPgae({super.key});

  @override
  State<MurdeshwarPgae> createState() => _MurdeshwarPgaeState();
}

class _MurdeshwarPgaeState extends State<MurdeshwarPgae> {
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
