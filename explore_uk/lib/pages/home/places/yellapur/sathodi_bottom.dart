import 'package:explore_uk/pages/maps/google-maps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SathodiBottom extends StatefulWidget {
  const SathodiBottom({super.key});

  @override
  State<SathodiBottom> createState() => _SathodiBottomState();
}

class _SathodiBottomState extends State<SathodiBottom> {
  bool isBookmark = false;

  final List<String> imageList = [
    'assets/images/sathodi.jpg',
    'assets/images/sathodi7.jpg',
    'assets/images/sathodi2.jpg',
    'assets/images/sathodi5.jpg',
    'assets/images/sathodi3.jpg',
    'assets/images/sathodi4.jpg',
    'assets/images/sathodi6.jpg',
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
                      "Sathodi, Yellapur",
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
                  'Sathoddi Falls is a picturesque waterfall located in the Western Ghats, Uttara Kannada District Located 32 km (20 mi) from Yellapur and 74 km (46 mi) from Sirsi. It is about 15 metres (49.2 feet) tall.[1] The stream then flows into the backwaters of the Kodasalli Dam, into the Kali River.',
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
                        'assets/images/sathodi7.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Image.asset(
                      'assets/images/sathodi4.jpg',
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
                                    image: AssetImage(
                                        'assets/images/sathodi3.jpg'),
                                    fit: BoxFit.cover,
                                    opacity: 0.4)),
                            child: Text(
                              '10+',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
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
