import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/model/new_and_hot_model.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/everyone_watching_widgets.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<NewAndHotModel>> comingSoonlist;
  late Future<List<NewAndHotModel>> everyonesWatchinglist;
  @override
  void initState() {
    super.initState();
    comingSoonlist = Api().getComingSoon();
    everyonesWatchinglist = Api().getEveryOnesWatching();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              actions: [
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
              bottom: TabBar(
                isScrollable: true,
                labelColor: blackColor,
                unselectedLabelColor: whitecolor,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  color: whitecolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: const [
                  Tab(
                    text: "🍿Coming Soon",
                  ),
                  Tab(
                    text: "👀Everyone's watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            FutureBuilder(
                future: comingSoonlist,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return _buildComingSoon(snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            FutureBuilder(
                future: everyonesWatchinglist,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return _buildEveryonesWatching(snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ])),
    );
  }

  Widget _buildComingSoon(AsyncSnapshot<List<NewAndHotModel>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, index) {
          final result = snapshot.data![index];
          return ComingSoonWidget(newAndHotModel: result);
        });
  }

  Widget _buildEveryonesWatching(AsyncSnapshot<List<NewAndHotModel>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, index) {
          final result = snapshot.data![index];
          return EveryoneWatchingWidget(newAndHotModel: result);
        });
  }
}
