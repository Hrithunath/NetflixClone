import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_buttonWwiget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    "Tall Girl 2",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind me",
                        iconsSize: 20,
                        textSize: 12,
                      ),
                      const SizedBox(width: 10),
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconsSize: 20,
                        textSize: 12,
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Coming on Friday"),
              const SizedBox(height: 10),
              const Text(
                "Tall Girl 2",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspin.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
