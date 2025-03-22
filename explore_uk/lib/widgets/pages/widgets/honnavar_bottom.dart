import 'package:explore_uk/pages/google-maps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HonnavarBottom extends StatefulWidget {
  const HonnavarBottom({super.key});

  @override
  State<HonnavarBottom> createState() => _HonnavarBottomState();
}

class _HonnavarBottomState extends State<HonnavarBottom> {
  bool isBookmark = false;
  final List<String> imageList = [
    'assets/images/honnavr.jpg',
    'assets/images/hnr.jpg',
    'assets/images/honnavar.jpg',
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
                      "Honnavar",
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
                          '4.7',
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
                  'Honnavar is a beautiful coastal town in Karnataka. It is known for its beaches, temples, and waterfalls. Honnavar is a perfect spot for a peaceful holiday or an exciting adventure. In this guide, we will explore the best places to visit in Honnavar and how an Insta Personal Loan can make your travel dreams come true.',
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
                        'assets/images/hnr.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Image.asset(
                      'assets/images/honnavr.jpg',
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
                                          'assets/images/honnavar.jpg'),
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
