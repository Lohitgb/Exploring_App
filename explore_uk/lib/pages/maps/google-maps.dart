import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GoogleMap extends StatefulWidget {
  const GoogleMap({super.key});

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Maps',
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
    );
  }
}
