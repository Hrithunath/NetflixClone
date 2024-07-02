import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/number_card.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const NumberTitleCard({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const MainTitle(title: "Top 10 TV Shows in India Today"),
      height,
      LimitedBox(
        maxHeight: 200,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NumberCard(
              imageUrl:
                  '${ApiConstants.imageurl}${snapshot.data[index].posterPath}',
              index: index,
            );
          },
          itemCount: snapshot.data.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ]);
  }
}
