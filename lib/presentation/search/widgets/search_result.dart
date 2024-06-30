import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/search/widgets/tiltle.dart';

const imageUrl = "https://media.themoviedb.org/t/p/w250_and_h141_face/kjQBrc00fB2RjHZB3PGR4w9ibpz.jpg,";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & Tv'),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1/1.4,
          children: List.generate(20, (index) {
            return MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(image: NetworkImage(imageUrl),
        fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
