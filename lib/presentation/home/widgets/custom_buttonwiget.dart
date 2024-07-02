import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconsSize = 30,
    this.textSize = 18,
  });
  final IconData icon;
  final String title;
  final double iconsSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whitecolor,
          size: iconsSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
