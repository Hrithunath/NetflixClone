import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/model/new_and_hot_model.dart';
import 'package:netflixclone/presentation/home/widgets/custom_buttonwiget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final NewAndHotModel newAndHotModel;
  const EveryoneWatchingWidget({
    super.key,
    required this.newAndHotModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height,
          Text(
            newAndHotModel.title ?? 'No title',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          height,
          Text(
            newAndHotModel.description ?? 'No description',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          VideoWidget(
            newAndHotModel: newAndHotModel,
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
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
      ),
    );
  }
}
