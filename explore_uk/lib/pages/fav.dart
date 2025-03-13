import 'package:explore_uk/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, required int selectedIndex});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fav Working',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.network(
              'https://lottie.host/6f5172ff-6d22-4647-96e1-d6b0ebe744ac/EsUbMGwwJw.json',
              animate: true,
              repeat: true,
              reverse: true,
              // height: 200,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(selectedIndex: 1),
    );
  }
}
