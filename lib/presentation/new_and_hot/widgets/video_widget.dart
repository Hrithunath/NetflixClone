import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/model/new_and_hot_model.dart';

class VideoWidget extends StatelessWidget {
  final NewAndHotModel newAndHotModel;
  const VideoWidget({super.key, required this.newAndHotModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            ApiConstants.imageurl + newAndHotModel.posterpath!,
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
