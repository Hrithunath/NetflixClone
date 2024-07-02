import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.dart';
import 'package:netflixclone/model/download_model.dart';
import 'package:netflixclone/presentation/fast_laugh/widget/video_list_item.dart';

class ScreenFastAndLaugh extends StatefulWidget {
  const ScreenFastAndLaugh({super.key});

  @override
  State<ScreenFastAndLaugh> createState() => _ScreenFastAndLaughState();
}

class _ScreenFastAndLaughState extends State<ScreenFastAndLaugh> {
  late Future<List<DownloadModel>> imageList;

  @override
  void initState() {
    super.initState();
    imageList = Api().getFastLaughImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: imageList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  return PageView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(snapshot.data!.length, (index) {
                      return VideoListItem(index: index, snapshot: snapshot);
                    }),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
