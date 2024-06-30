import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflixclone/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';
import 'package:netflixclone/presentation/main_page/widget/bottom_nav.dart';
import 'package:netflixclone/presentation/new_and_hot/screen_new_hot.dart';
import 'package:netflixclone/presentation/search/screen_search.dart';



class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastAndLaugh(),
    const ScreenSearch(),
     ScreenDownloads(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier, 
          builder: (context,int index,_){
            return pages[index];
          }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}