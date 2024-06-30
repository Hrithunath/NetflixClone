
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/presentation/search/widgets/tiltle.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w250_and_h141_face/kjQBrc00fB2RjHZB3PGR4w9ibpz.jpg,";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

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
              itemBuilder: (context, index) => const TopSearchItemTile(),
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
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: ScreenWidth* 0.35,
          height: 65,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        const Expanded(child: Text('movies',style: TextStyle(color: Colors.white),)),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child:Icon(CupertinoIcons.play_fill,color: Colors.white,),
          ),
        )
      ],
    );
  }
}
