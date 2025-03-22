import 'package:flutter/material.dart';

class CardAppBar extends StatefulWidget {
  const CardAppBar({super.key});

  @override
  State<CardAppBar> createState() => _CardAppBarState();
}

class _CardAppBarState extends State<CardAppBar> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.white, blurRadius: 6)]),
              child: Icon(
                Icons.arrow_back,
                size: 28,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)]),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
