import 'package:explore_uk/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key, required int selectedIndex});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'city Working',
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
      bottomNavigationBar: BottomBar(
        selectedIndex: 3,
      ),
    );
  }
}
