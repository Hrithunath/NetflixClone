import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/model/search_model.dart';
import 'package:netflixclone/presentation/search/widgets/tiltle.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w250_and_h141_face/kjQBrc00fB2RjHZB3PGR4w9ibpz.jpg,";

class SearchIdleWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const SearchIdleWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Search'),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final result = snapshot.data[index];
                return TopSearchItemTile(searchModel: result,);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final SearchModel searchModel;
  const TopSearchItemTile({super.key,required this.searchModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(ApiConstants.imageurl+searchModel.posterPath!))),
        ),
        Expanded(
            child: Text(
          searchModel.movieName ?? 'no name' ,
          style: const TextStyle(color: Colors.white),
        )),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
