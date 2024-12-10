import 'package:explore_uk/pages/landing_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const title = 'Explore UK';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(scaffoldBackgroundColor: Colors.amber[100]),
      home: const LandingPage(),
    );
  }
}
