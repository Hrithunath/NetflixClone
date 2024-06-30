import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 10),
          width: 130,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: radius10,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://media.themoviedb.org/t/p/w250_and_h141_face/w7aIPADuAQTa7n7ooRKHclpxmYu.jpg",
              ),
            ),
          ),
        ),
        Positioned(
          left: -10,
          top: 30,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.black,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: whitecolor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
