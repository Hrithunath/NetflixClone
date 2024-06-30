import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://image.tmdb.org/t/p/original/waLsi24ZpjBCeSX6oGm1vIz1wVS.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: whitecolor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
