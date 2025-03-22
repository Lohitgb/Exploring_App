import 'package:explore_uk/pages/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAwLhmwAGbYlecz9dcd9Bl4i1q4ZvqdHlo",
        authDomain: "exploreuk-5dea7.firebaseapp.com",
        projectId: "exploreuk-5dea7",
        storageBucket: "exploreuk-5dea7.firebasestorage.app",
        messagingSenderId: "624959196075",
        appId: "1:624959196075:web:846e95f1d74da18eeaa0ee",
        measurementId: "G-TGB787JDLB"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const title = 'Explore UK';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(scaffoldBackgroundColor: Colors.amber[100]),
      home: const LandingPage(),
    );
  }
}
