import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/background_card.dart';
import 'package:netflixclone/presentation/home/widgets/number_card.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';


ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTitleCard(
                    cardtitle: "Released in the past year",
                  ),
                  height,
                  MainTitleCard(
                    cardtitle: "Trending Now",
                  ),
                  height,
                  NumberTitleCard(),
                  height,
                  MainTitleCard(
                    cardtitle: "Tense Dramas",
                  ),
                  height,
                  MainTitleCard(
                    cardtitle: "South Indian Cinema",
                  ),
                  height,
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://cdn-images-1.medium.com/v2/resize:fit:1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                width: 60,
                                height: 60,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                size: 30,
                                color: whitecolor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("TV Shows", style: homeTiTleText),
                              Text("Movies", style: homeTiTleText),
                              Text("Categories", style: homeTiTleText),
                            ],
                          )
                        ],
                      ),
                    )
                  : height,
            ],
          ),
        );
      },
    ));
  }
}


class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 TV Shows in India Today"),
        height,
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NumberCard(
                  index: index,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}


class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/ucpdBAvtLxWvQPG09Xd3TgGuxwE.jpg";
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: radius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
           
          ),
        ),
      ),
    );
  }
}

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.cardtitle});
  final String cardtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: cardtitle),
        height,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const MainCard(),
            ),
          ),
        )
      ],
    );
  }
}
