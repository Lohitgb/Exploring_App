import 'package:explore_uk/widgets/bottombar.dart';
import 'package:explore_uk/widgets/pages/karwar.dart';
import 'package:explore_uk/widgets/pages/kumta.dart';
import 'package:explore_uk/widgets/pages/magod.dart';
import 'package:explore_uk/widgets/pages/yana.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _Homepage1State();
}

class _Homepage1State extends State<HomePage> {
  final List<Map<String, String>> places = [
    {'image': 'assets/images/magod.jpg', 'name': 'Kumta'},
    {'image': 'assets/images/sathodi.jpg', 'name': 'Karwar'},
    {'image': 'assets/images/sathodi1.jpg', 'name': 'Magod'},
    {'image': 'assets/images/yana1.jpg', 'name': 'Yana'},
    {'image': 'assets/images/tagore.jpg', 'name': 'Kumta'},
    {'image': 'assets/images/yana2.jpg', 'name': 'Kumta'}
  ];

  final listPlaces = [
    'best  places',
    'most visted',
    'hiking',
    'treking',
    'beaches'
  ];

  // Mapping places to their respective pages
  final Map<String, Widget> placePages = {
    'Kumta': Kumta(),
    'Magod': MagodPage(),
    'Yana': Yana(),
    'Karwar': KarwarPage(),
    // 'Ankola': AnkolaPage(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        // child: Padding(
        // padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              color: Color(0xFF00BF6D),
              child: Form(
                  child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) {},
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
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // String placeName = places[index]['name']!;
                          // Widget destinationPage = placePages[placeName] ??
                          //     Kumta(); // Default to KumtaPage

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => destinationPage),
                          // );
                        },
                        child: Container(
                          width: 165,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(places[index]['image']!),
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
                                  places[index]['name']!,
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
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: places.length * 230,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            String placeName = places[index]['name']!;
                            Widget destinationPage = placePages[placeName] ??
                                Kumta(); // Default to KumtaPage

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => destinationPage),
                            );
                          },
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => Yana()));
                          // },
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => PostScreen(
                          //         image: places[index]['image']!,
                          //         name: places[index]['name']!,
                          //       ),
                          //     ),
                          //   );
                          // },

                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(places[index]['image']!),
                                  fit: BoxFit.cover,
                                  opacity: 0.8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                places[index]['name']!,
                                style: GoogleFonts.getFont('Roboto Condensed',
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
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
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );

    // );
  }
}
