import 'package:explore_uk/pages/navigation/taluk_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnkolaPlaces extends StatefulWidget {
  const AnkolaPlaces({super.key});

  @override
  State<AnkolaPlaces> createState() => _AnkolaPlacesState();
}

class _AnkolaPlacesState extends State<AnkolaPlaces> {
  late final PageController _controller;

  final List<Map<String, String>> locations = [];

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.7,
      initialPage: locations.length ~/ 2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // use for responive design
    final size = MediaQuery.of(context).size;
    return TalukNavigation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.6,
            child: PageView.builder(
              itemCount: locations.length,
              controller: _controller,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Container(
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 7),
                              color: Colors.transparent.withOpacity(.3),
                              blurRadius: 10)
                        ],
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              locations.elementAt(index)['image']!,
                              fit: BoxFit.cover,
                            ),
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
                                      Colors.black.withOpacity(.8)
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
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
