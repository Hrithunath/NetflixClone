import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/home/widgets/custom_buttonWwiget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
          children: [
            Container(
              width: double.infinity,
              height: 600,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/pmAv14TPE2vKMIRrVeCd1Ll7K94.jpg"),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomButtonWidget(
                      title: "My List",
                      icon: Icons.add,
                    ),
                    _PlayButton(),
                    const CustomButtonWidget(icon: Icons.info, title: 'info')
                  ],
                ),
              ),
            )
          ],
        );
  }
    TextButton _PlayButton() {
    return TextButton.icon(
        onPressed: () {},
        style:
            const ButtonStyle(backgroundColor: MaterialStatePropertyAll(whitecolor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ))),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.black,
        ),
        label: const Text(
          'Play',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ));
  }
  
}