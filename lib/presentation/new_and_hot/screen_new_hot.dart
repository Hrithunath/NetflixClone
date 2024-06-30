import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_buttonWwiget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/everyone_watching_widgets.dart';
import 'package:netflixclone/presentation/new_and_hot/widgets/video_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

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
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }
   Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const EveryoneWatchingWidget(),
    );
  }
}

