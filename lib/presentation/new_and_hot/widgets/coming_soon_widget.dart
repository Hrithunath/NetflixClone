import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/model/new_and_hot_model.dart';
import 'package:netflixclone/presentation/home/widgets/custom_buttonwiget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final NewAndHotModel newAndHotModel;
  const ComingSoonWidget({super.key, required this.newAndHotModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              VideoWidget(
                newAndHotModel: newAndHotModel,
              ),
              SizedBox(width: size.width - 50, height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      newAndHotModel.title ?? 'Notitle',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind me",
                        iconsSize: 20,
                        textSize: 12,
                      ),
                      SizedBox(width: 10),
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconsSize: 20,
                        textSize: 12,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text("Coming on Friday"),
              const SizedBox(height: 25,),
              Text(
                newAndHotModel.title ?? 'No title',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height,
              Text(
                newAndHotModel.description ?? 'Nodescription',
                style: const TextStyle(
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
