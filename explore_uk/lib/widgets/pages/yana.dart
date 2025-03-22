import 'package:explore_uk/widgets/pages/widgets/cardappbar.dart';
import 'package:explore_uk/widgets/pages/widgets/post_bottom_bar.dart';
import 'package:flutter/material.dart';

class Yana extends StatefulWidget {
  const Yana({super.key});

  @override
  State<Yana> createState() => _YanaState();
}

class _YanaState extends State<Yana> {
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


// for 2 images

// import 'package:explore_uk/widgets/kar.dart';
// import 'package:explore_uk/widgets/kumta.dart';
// import 'package:flutter/material.dart';
// // import 'karwar_screen.dart';
// // import 'kumta_screen.dart'; // Import Kumta page

// class PostScreen extends StatefulWidget {
//   final String image;
//   final String name;

//   const PostScreen({super.key, required this.image, required this.name});

//   @override
//   State<PostScreen> createState() => _PostscreenState();
// }

// class _PostscreenState extends State<PostScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name)),
//       body: Column(
//         children: [
//           Image.asset(widget.image, fit: BoxFit.cover),
//           ElevatedButton(
//             onPressed: () {
//               if (widget.name.toLowerCase() == 'karwar') {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => KarwarScreen()),
//                 );
//               } else if (widget.name.toLowerCase() == 'kumta') {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => KumtaScreen()),
//                 );
//               }
//             },
//             child: Text('Explore ${widget.name}'),
//           ),
//         ],
//       ),
//     );
//   }
// }


//for 2/3 images

// import 'package:flutter/material.dart';
// import 'karwar_screen.dart';
// import 'kumta_screen.dart';
// import 'ankola_screen.dart';
// import 'gokarna_screen.dart';
// import 'murudeshwar_screen.dart';
// import 'dandeli_screen.dart';

// class PostScreen extends StatefulWidget {
//   final String image;
//   final String name;

//   const PostScreen({super.key, required this.image, required this.name});

//   @override
//   State<PostScreen> createState() => _PostscreenState();
// }

// class _PostscreenState extends State<PostScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name)),
//       body: Column(
//         children: [
//           Image.asset(widget.image, fit: BoxFit.cover),
//           ElevatedButton(
//             onPressed: () {
//               Widget nextScreen;

//               switch (widget.name.toLowerCase()) {
//                 case 'karwar':
//                   nextScreen = KarwarScreen();
//                   break;
//                 case 'kumta':
//                   nextScreen = KumtaScreen();
//                   break;
//                 case 'ankola':
//                   nextScreen = AnkolaScreen();
//                   break;
//                 case 'gokarna':
//                   nextScreen = GokarnaScreen();
//                   break;
//                 case 'murudeshwar':
//                   nextScreen = MurudeshwarScreen();
//                   break;
//                 case 'dandeli':
//                   nextScreen = DandeliScreen();
//                   break;
//                 default:
//                   nextScreen = Scaffold(
//                     appBar: AppBar(title: Text('Unknown Place')),
//                     body: Center(
//                       child: Text('No details available for this place.'),
//                     ),
//                   );
//               }

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => nextScreen),
//               );
//             },
//             child: Text('Explore ${widget.name}'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ✅ Clicking Karwar → Opens PostScreen → Clicking "Explore Karwar" → Opens KarwarScreen
// ✅ Clicking Kumta → Opens PostScreen → Clicking "Explore Kumta" → Opens KumtaScreen
// ✅ Clicking Ankola → Opens PostScreen → Clicking "Explore Ankola" → Opens AnkolaScreen
// ✅ Clicking Gokarna → Opens PostScreen → Clicking "Explore Gokarna" → Opens GokarnaScreen
// ✅ Clicking Murudeshwar → Opens PostScreen → Clicking "Explore Murudeshwar" → Opens MurudeshwarScreen
// ✅ Clicking Dandeli → Opens PostScreen → Clicking "Explore Dandeli" → Opens DandeliScreen


// like this

// final List<Map<String, String>> places = [
//   {'image': 'assets/images/magod.jpg', 'name': 'Kumta'},
//   {'image': 'assets/images/sathodi.jpg', 'name': 'Karwar'},
//   {'image': 'assets/images/sathodi1.jpg', 'name': 'Ankola'},
//   {'image': 'assets/images/gokarna.jpg', 'name': 'Gokarna'},
//   {'image': 'assets/images/murudeshwar.jpg', 'name': 'Murudeshwar'},
//   {'image': 'assets/images/dandeli.jpg', 'name': 'Dandeli'},
// ];

