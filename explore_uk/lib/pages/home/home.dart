import 'package:explore_uk/pages/navigation/bottombar.dart';
import 'package:explore_uk/pages/home/places/honnavr/honnavr.dart';
import 'package:explore_uk/pages/home/places/karwar/karwar.dart';
import 'package:explore_uk/pages/home/places/kumta/mirjan.dart';
import 'package:explore_uk/pages/home/places/yellapur/magod.dart';
import 'package:explore_uk/pages/home/places/bhatkal/murdeshwar.dart';
import 'package:explore_uk/pages/home/places/yellapur/sathodi.dart';
import 'package:explore_uk/pages/home/places/kumta/yana.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required int selectedIndex});

  @override
  State<HomePage> createState() => _Homepage1State();
}

class _Homepage1State extends State<HomePage> {
  final List<Map<String, String>> Taluk = [
    {
      'image': 'assets/images/kwr6.jpg',
      'name': 'Karwar',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Ankola',
    },
    {
      'image': 'assets/images/kmt8.jpg',
      'name': 'Kumta',
    },
    {
      'image': 'assets/images/hnr.jpg',
      'name': 'Honnvar',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Bhatkal',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Sirsi',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Siddapur',
    },
    {
      'image': 'assets/images/magod.jpg',
      'name': 'Yellapur',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Mundgod',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Haliyal',
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Joida',
    }
  ];

  final List<Map<String, String>> places = [
    {
      'image': 'assets/images/honnavr.jpg',
      'name': 'Honnavar',
      'description': 'A beautiful coastal town'
    },
    {
      'image': 'assets/images/magod6.jpg',
      'name': 'Magod',
      'description': 'Stunning waterfalls'
    },
    {
      'image': 'assets/images/mir1.jpg',
      'name': 'Mirjan',
      'description': 'Historical fort'
    },
    {
      'image': 'assets/images/sathodi.jpg',
      'name': 'Sathodi',
      'description': 'A hidden gem'
    },
    {
      'image': 'assets/images/kwr1.jpeg',
      'name': 'Karwar',
      'description': 'Scenic beach destination'
    },
    {
      'image': 'assets/images/yana2.jpg',
      'name': 'Yana',
      'description': 'Unique rock formations'
    },
    {
      'image': 'assets/images/mur.jpg',
      'name': 'Murdeshwar',
      'description': 'Famous for Lord Shiva statue'
    },
  ];

  final listPlaces = [
    'best places',
    'most visited',
    'hiking',
    'trekking',
    'beaches'
  ];

  // Mapping places to their respective pages
  final Map<String, Widget> placePages = {
    'Mirjan': Mirjan(),
    'Magod': MagodPage(),
    'Sathodi': Sathodi(),
    'Yana': Yana(),
    'Karwar': KarwarPage(),
    'Murdeshwar': MurdeshwarPage(),
    'Honnavar': HonnavrPage(),
  };

  List<Map<String, String>> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = List.from(places);
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlaces = List.from(places);
      } else {
        filteredPlaces = places
            .where((place) =>
                place['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF00BF6D),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Explore Places',
          style: GoogleFonts.getFont('Roboto Condensed',
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              color: Color(0xFF00BF6D),
              child: Form(
                  child: TextFormField(
                autofocus: false,
                textInputAction: TextInputAction.search,
                onChanged: (value) => filterSearch(value),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    // ignore: deprecated_member_use
                    color: Color(0xFF1D1D35).withOpacity(0.64),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 12.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              )),
            ),
            SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: Taluk.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 165,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(Taluk[index]['image']!),
                                  fit: BoxFit.cover,
                                  opacity: 0.7)),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  Taluk[index]['name']!,
                                  style: GoogleFonts.getFont('Roboto Condensed',
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 4)
                            ]),
                        child: Text(
                          listPlaces[i],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredPlaces.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          String placeName = filteredPlaces[index]['name']!;
                          Widget destinationPage =
                              placePages[placeName] ?? Mirjan();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => destinationPage),
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          // ignore: deprecated_member_use
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 10), // Moves shadow downward only
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                      filteredPlaces[index]['image']!),
                                  fit: BoxFit.cover,
                                  opacity: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Place Name
                                  Text(
                                    filteredPlaces[index]['name']!,
                                    style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 3),

                                  // Description
                                  Text(
                                    filteredPlaces[index]['description']!,
                                    style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '4.3 ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      SizedBox(
                        width: double.infinity,
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 1,
                        ),
                      )
                      // SizedBox(height: 5),
                    ],
                  ),
                );
              },
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomBar(selectedIndex: 2),
    );
  }
}
