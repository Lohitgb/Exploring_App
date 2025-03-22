import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostBottomBar extends StatefulWidget {
  const PostBottomBar({super.key});

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  bool isBookmark = false;

  final List<String> imageList = [
    'assets/images/yana.jpg',
    'assets/images/yana2.jpg',
    'assets/images/yana1.jpg',
    // 'assets/images/yana3.jpg',
    // 'assets/images/yana4.jpg'
  ];

  void showFullImageGallery() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => showImageDialog(imageList[index]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imageList[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }

  void showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFEDF2F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Yana, Kumta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 25),
                      Text('4.5',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Description
              const Text(
                'Yana is a tourist destination located in forest of Katgal Range, which is also a part of Malenadu region of Uttara Kannada district of Karnataka state in India. Yana is one of the wettest villages in the world...',
                style: TextStyle(fontSize: 15, color: Color(0xFF525252)),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Images
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/yana.jpg',
                      fit: BoxFit.cover,
                      height: 90,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Image.asset(
                      'assets/images/yana2.jpg',
                      fit: BoxFit.cover,
                      height: 90,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: showFullImageGallery,
                      child: Container(
                        alignment: Alignment.center,
                        height: 90,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/yana1.jpg'),
                            fit: BoxFit.cover,
                            opacity: 0.4,
                          ),
                        ),
                        child: const Text(
                          '10+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Bottom Buttons
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: showFullImageGallery,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 4)
                          ],
                        ),
                        child: Text(
                          'Go Now',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
