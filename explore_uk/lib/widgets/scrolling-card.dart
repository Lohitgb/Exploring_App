import 'package:flutter/material.dart';

class ScrollongCard extends StatefulWidget {
  const ScrollongCard({super.key});

  @override
  State<ScrollongCard> createState() => _ScrollongCardState();
}

class _ScrollongCardState extends State<ScrollongCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 160,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/magod.jpg'),
                                  fit: BoxFit.cover,
                                  opacity: 0.7)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
          ]),
        ),
      )),
    );
  }
}
