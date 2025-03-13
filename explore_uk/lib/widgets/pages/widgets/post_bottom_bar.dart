import 'package:explore_uk/pages/google-maps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostBottomBar extends StatefulWidget {
  const PostBottomBar({super.key});

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
        // bottom: 5,
      ),
      decoration: BoxDecoration(
          color: Color(0xFFEDF2F6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Yana, Kumta',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Yana is a tourist destination located in forest of Katgal Range, which is also a part of Malenadu region of Uttara Kannada district of Karnataka state in India. Yana is one of the wettest villages in the world. It is the cleanest village in Karnataka and the second cleanest village in India. The two unique rock outcrops after the village are tourist attractions and easily approachable by two routes one from Kumta-Sirsi Highway by a small trek through 0.5 kilometres (0.31 mi) the thick forests from the nearest road head and another from Sirsi-Ankola Road.',
                  style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 82, 82, 82)),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/yana.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                        // width: 120,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Image.asset(
                        'assets/images/yana2.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                        // width: 120,
                        // ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        // width: 120,
                        height: 90,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage('assets/images/yana1.jpg'),
                                fit: BoxFit.cover,
                                opacity: 0.4)),
                        child: Text(
                          '10+',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         BoxShadow(color: Colors.black26, blurRadius: 4)
                      //       ]),
                      //   child: Icon(
                      //     isBookmark ? Icons.bookmark : Icons.bookmark_outline,
                      //     color: isBookmark ? Colors.amber : Colors.black,
                      //     size: 40,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoogleMap()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ]),
                          child: Text(
                            'Go Now',
                            style: GoogleFonts.getFont('Roboto Condensed',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//when we click show all photos images code below one plases update later
// GestureDetector(
//   onTap: showFullImageGallery,
//   child: Container(
//     alignment: Alignment.center,
//     width: 120,
//     height: 90,
//     margin: EdgeInsets.only(right: 5),
//     decoration: BoxDecoration(
//       color: Colors.black,
//       borderRadius: BorderRadius.circular(15),
//       image: DecorationImage(
//         image: AssetImage('assets/images/yana1.jpg'),
//         fit: BoxFit.cover,
//         opacity: 0.4,
//       ),
//     ),
//     child: Text(
//       '10+',
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 22,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//   ),
// ),

// void showFullImageGallery() {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.black.withOpacity(0.8),
//     builder: (context) => Container(
//       height: MediaQuery.of(context).size.height * 0.8,
//       padding: EdgeInsets.all(10),
//       child: GridView.builder(
//         itemCount: imageList.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () => showImageDialog(imageList[index]),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.asset(imageList[index], fit: BoxFit.cover),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }

// void showImageDialog(String imagePath) {
//   showDialog(
//     context: context,
//     builder: (context) => Dialog(
//       backgroundColor: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Image.asset(imagePath, fit: BoxFit.cover),
//       ),
//     ),
//   );
// }
