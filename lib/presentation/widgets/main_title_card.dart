import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';
import 'package:netflixclone/presentation/widgets/main_card.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String cardtitle;
  final AsyncSnapshot snapshot;
  const MainTitleCard(
      {super.key, required this.cardtitle, required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: cardtitle),
        height,
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MainCard(
                imageUrl:
                    '${ApiConstants.imageurl}${snapshot.data[index].posterPath}',
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
