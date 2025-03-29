import 'package:explore_uk/pages/navigation/taluk_nav.dart';
import 'package:flutter/material.dart';

class KwrPlaces extends StatefulWidget {
  const KwrPlaces({super.key});

  @override
  State<KwrPlaces> createState() => _KwrPlacesState();
}

class _KwrPlacesState extends State<KwrPlaces> {
  late final PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.7);
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
                // itemCount: locations.leangth,
                // controller: _controller,
                itemBuilder: (context, index) {
              // Location location = locations[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),

                child: Center(
                  child: Container(
                    height: size.height * .5,
                    decoration: BoxDecoration(
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
                        Image.asset('assets/images/honnavr.jpg',
                            fit: BoxFit.cover),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: size.height * .15,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(.8)
                                  ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
