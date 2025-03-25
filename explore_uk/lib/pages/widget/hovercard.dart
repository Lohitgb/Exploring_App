import 'dart:ui';

import 'package:flutter/material.dart';

class GlassHover extends StatelessWidget {
  const GlassHover({super.key});

  final List<Map<String, String>> places = const [
    {
      'title': 'Yana',
      'image':
          'https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2024/09/09190057/yana-caves-1-1600x900.jpeg',
      'slogan': 'Mystical Rock Formations',
      'description':
          'Yana Caves, known for black crystalline limestone rock formations.',
    },
    {
      'title': 'Yana',
      'image':
          'https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2024/09/09190057/yana-caves-1-1600x900.jpeg',
      'slogan': 'Mystical Rock Formations',
      'description':
          'Yana Caves, known for black crystalline limestone rock formations.',
    },
    {
      'title': 'Yana',
      'image':
          'https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2024/09/09190057/yana-caves-1-1600x900.jpeg',
      'slogan': 'Mystical Rock Formations',
      'description':
          'Yana Caves, known for black crystalline limestone rock formations.',
    },
    {
      'title': 'Yana',
      'image':
          'https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2024/09/09190057/yana-caves-1-1600x900.jpeg',
      'slogan': 'Mystical Rock Formations',
      'description':
          'Yana Caves, known for black crystalline limestone rock formations.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return HoverCardWidget(
            title: place['title']!,
            image: place['image']!,
            slogan: place['slogan']!,
            description: place['description']!,
          );
        },
      ),
    );
  }
}

class HoverCardWidget extends StatefulWidget {
  final String title;
  final String image;
  final String slogan;
  final String description;

  const HoverCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.slogan,
    required this.description,
  });

  @override
  State<HoverCardWidget> createState() => _HoverCardWidgetState();
}

class _HoverCardWidgetState extends State<HoverCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<Offset>(begin: Offset(11.0, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => controller.forward(),
      onExit: (event) => controller.reverse(),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 320,
          width: 220,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(widget.image), fit: BoxFit.cover),
                ),
              ),
              SlideTransition(
                position: animation,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          TextUtil(
                            text: widget.title,
                            weight: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextUtil(
                            text: widget.description,
                            size: 12,
                            weight: true,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange])),
                              alignment: Alignment.center,
                              child: TextUtil(
                                  text: 'Explore More', size: 12, weight: true),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  height: 320,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 4)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextUtil extends StatelessWidget {
  // const TextUtil({super.key});

  final String text;
  final Color? color;
  final double? size;
  final bool? weight;
  const TextUtil(
      {super.key, required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: size ?? 18,
          fontWeight: weight == null ? FontWeight.normal : FontWeight.w900),
    );
  }
}
