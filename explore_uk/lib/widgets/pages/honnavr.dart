import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/honnavar_bottom.dart';
import 'package:flutter/material.dart';

class HonnavrPage extends StatefulWidget {
  const HonnavrPage({super.key});

  @override
  State<HonnavrPage> createState() => _HonnavrPageState();
}

class _HonnavrPageState extends State<HonnavrPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/honnavr.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(115), child: CardAppBar()),
        bottomNavigationBar: HonnavarBottom(),
      ),
    );
  }
}
