import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/post_bottom_bar.dart';
import 'package:flutter/material.dart';

class KarwarPage extends StatefulWidget {
  const KarwarPage({super.key});

  @override
  State<KarwarPage> createState() => _KarwarPageState();
}

class _KarwarPageState extends State<KarwarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/tagore.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(115), child: CardAppBar()),
        bottomNavigationBar: PostBottomBar(),
      ),
    );
  }
}
