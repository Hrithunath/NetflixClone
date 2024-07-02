import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixclone/api/api.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/model/download_model.dart';
import 'package:netflixclone/presentation/home/widgets/background_card.dart';
import 'package:netflixclone/presentation/home/widgets/number_title_card.dart';
import 'package:netflixclone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<DownloadModel>> trendingImagelist;
  late Future<List<DownloadModel>> lastYearMoviesList;
  late Future<List<DownloadModel>> tenseDramas;
  late Future<List<DownloadModel>> southIndianMovies;
  late Future<List<DownloadModel>> topTvShows;

  @override
  void initState() {
    super.initState();
    trendingImagelist = Api().getTrendingMovies();
    lastYearMoviesList = Api().getLastYearMovies();
    tenseDramas = Api().getTenseDramas();
    southIndianMovies = Api().getSouthIndianMovies();
    topTvShows = Api().getTopTvShows();
  }

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
                children: [
                  const BackgroundCard(),
                  height,
                  //  MainTitleCard(cardTitle: 'Released in the past year'),
                  SizedBox(
                    child: FutureBuilder(
                        future: lastYearMoviesList,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                cardtitle: 'Released in the past year',
                                snapshot: snapshot);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                  height,
                  SizedBox(
                    child: FutureBuilder(
                        future: trendingImagelist,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                cardtitle: 'Trending Now', snapshot: snapshot);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),

                  height,
                  SizedBox(
                    child: FutureBuilder(
                        future: topTvShows,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            return NumberTitleCard(snapshot: snapshot);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                  height,
                  SizedBox(
                    child: FutureBuilder(
                        future: tenseDramas,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                cardtitle: 'Tense Dramas', snapshot: snapshot);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                  height,

                  SizedBox(
                    child: FutureBuilder(
                        future: southIndianMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                cardtitle: 'South Indian cinemas',
                                snapshot: snapshot);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
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
