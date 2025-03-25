import 'package:explore_uk/pages/maps/google-maps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MirjanBottom extends StatefulWidget {
  const MirjanBottom({super.key});

  @override
  State<MirjanBottom> createState() => _MirjanBottomState();
}

class _MirjanBottomState extends State<MirjanBottom> {
  bool isBookmark = false;

  final List<String> imageList = [
    'assets/images/mirjan.jpeg',
    'assets/images/mir.jpg',
    'assets/images/mir1.jpg',
    'assets/images/mir2.jpg',
    'assets/images/mir3.jpg',
    'assets/images/mir4.jpg',
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
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => showImageDialog(imageList[index]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
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
                      "Mirjan, Kumta",
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
                          '4.3',
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
                  'Nestled along the picturesque Arabian Sea coast, Mirjan Port is a hidden gem of Karnataka, renowned for its stunning natural beauty and historical significance. Once a thriving port town, Mirjan is home to a series of serene beaches and unique rock formations that draw in tourists and locals alike. At the heart of the port lies a fascinating fort, offering a glimpse into Mirjans rich past and the flourishing trade that once took place here.',
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
                        'assets/images/mir1.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Image.asset(
                      'assets/images/mir2.jpg',
                      fit: BoxFit.cover,
                      height: 90,
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: GestureDetector(
                            onTap: showFullImageGallery,
                            child: Container(
                              alignment: Alignment.center,
                              height: 90,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/mir.jpg'),
                                      fit: BoxFit.cover,
                                      opacity: 0.4)),
                              child: Text(
                                '10+',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                            )))
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
