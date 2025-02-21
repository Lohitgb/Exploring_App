import 'package:explore_uk/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/post_bottom_bar.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/yana1.jpg'),
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
