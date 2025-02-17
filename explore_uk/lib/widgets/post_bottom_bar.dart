import 'package:flutter/material.dart';

class PostBottomBar extends StatefulWidget {
  const PostBottomBar({super.key});

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
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
            padding: EdgeInsets.only(),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Yana, Kumta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                        '4.5',
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
                'Yana is a tourist destination located in forest of Katgal Range, which is also a part of Malenadu region of Uttara Kannada district of Karnataka state in India. Yana is one of the wettest villages in the world. It is the cleanest village in Karnataka and the second cleanest village in India. The two unique rock outcrops after the village are tourist attractions and easily approachable by two routes one from Kumta-Sirsi Highway by a small trek through 0.5 kilometres (0.31 mi) the thick forests from the nearest road head and another from Sirsi-Ankola Road.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Expanded(
                      child: Image.asset(
                        'assets/images/yana2.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                        width: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Expanded(
                      child: Image.asset(
                        'assets/images/yana2.jpg',
                        fit: BoxFit.cover,
                        height: 90,
                        width: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage('assets/images/yana2.jpg'),
                        fit: BoxFit.cover,
                        height: 90,
                        width: 80,
                      ),
                    )),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 90,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/images/yana1.jpg'),
                            fit: BoxFit.cover,
                            opacity: 0.6)),
                  ))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
