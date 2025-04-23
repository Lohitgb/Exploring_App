import 'package:explore_uk/pages/navigation/taluk_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YlprPlaces extends StatefulWidget {
  const YlprPlaces({super.key});

  @override
  State<YlprPlaces> createState() => _YlprPlacesState();
}

class _YlprPlacesState extends State<YlprPlaces> {
  late final PageController _controller;

  final List<Map<String, String>> locations = [
    {
      'image': 'assets/images/magod.jpg',
      'name': 'Magod Falls',
      // 'description': 'A beautiful coastal town'
    },
    {
      'image': 'assets/images/magod1.jpg',
      'name': 'Magod Falls',
      // 'description': 'Stunning waterfalls'
    },
    {
      'image': 'assets/images/magod2.jpg',
      'name': 'Magod Falls',
      // 'description': 'Historical fort'
    },
    {
      'image': 'assets/images/magod3.jpg',
      'name': 'Magod Falls',
      // 'description': 'Historical fort'
    },
    {
      'image': 'assets/images/sathodi1.jpg',
      'name': 'Sathodi Falls',
      // 'description': 'Historical fort'
    },
    {
      'image': 'assets/images/sathodi2.jpg',
      'name': 'Sathodi Falls',
      // 'description': 'Historical fort'
    },
    {
      'image': 'assets/images/sathodi3.jpg',
      'name': 'Sathodi Falls',
      // 'description': 'Historical fort'
    },
    // {
    //   'image': 'assets/images/kwr.jpeg',
    //   'name': 'Mirjan',
    //   // 'description': 'Historical fort'
    // },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.7,
      initialPage: locations.length ~/ 2,
    ); // Starts from the middle image);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // it is use for responive design
    final size = MediaQuery.of(context).size;

    return TalukNavigation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // here mediaqury is used to get the height and width of the screen
            height: size.height * 0.6,
            child: PageView.builder(
              itemCount: locations.length,
              controller: _controller,
              itemBuilder: (context, index) {
                // Map<String, String> location = locations[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),

                  child: Center(
                    child: Container(
                      height: size.height * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 7),
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10)
                        ],
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        // children: [Image.asset(loacation.image)],
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                                locations.elementAt(index)['image']!,
                                fit: BoxFit.cover),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: size.height * .15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(.8),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      locations.elementAt(index)['name']!,
                                      // 'kumta',
                                      style: GoogleFonts.getFont(
                                          "Roboto Condensed",
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
