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
    {'image': 'assets/images/sathodi.jpg', 'name': 'karwar'},
    {'image': 'assets/images/sathodi1.jpg', 'name': 'ankola'},
    {'image': 'assets/images/yana1.jpg', 'name': 'Kumta'},
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
                          onTap: () {},
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
                                    style: GoogleFonts.getFont(
                                        'Roboto Condensed',
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
                      child: InkWell(
                        onTap: () {},
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
                    );
                  },
                ),
              ),
            ]),
          ),
        ));
    // );
  }
}
