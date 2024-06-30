import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_buttonWwiget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height,
        Text(
          "Friends",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        height,
        const Text(
          "Landing the lead in the school musical is a dream come true for jodi,until the pressure sends her confidence - and her relationship - into a tailspain.",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        VideoWidget(),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconsSize: 25,
              textSize: 16,
            ),
            width,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconsSize: 25,
              textSize: 16,
            ),
            width,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconsSize: 25,
              textSize: 16,
            ),
            width,
          ],
        )
      ],
    );
  }
}
