import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/ucpdBAvtLxWvQPG09Xd3TgGuxwE.jpg";
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: radius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
           
          ),
        ),
      ),
    );
  }
}