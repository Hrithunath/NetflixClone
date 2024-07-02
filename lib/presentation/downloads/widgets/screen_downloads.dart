import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/api/api.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';
import 'package:netflixclone/model/download_model.dart';

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  late Future<List<DownloadModel>> imageListFuture;

  @override
  void initState() {
    super.initState();
    imageListFuture = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
          titile: '',
        ),
      ),
      body: FutureBuilder<List<DownloadModel>>(
        future: imageListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final imageList = snapshot.data!;
            final widgetList = [
              const SmartDownloads(),
              Section2(imageList: imageList),
              const Section3(),
            ];
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => widgetList[index],
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemCount: widgetList.length,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  final List<DownloadModel> imageList;

  const Section2({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'We will download a personalised selection of \nmovies and shows for you, so there is\n always something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImageWidget(
                model: imageList[0],
                margin: const EdgeInsets.only(left: 170, top: 50),
                angle: 25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                model: imageList[1],
                margin: const EdgeInsets.only(right: 170, top: 50),
                angle: -20,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                model: imageList[2],
                radius: 8,
                margin: const EdgeInsets.only(bottom: 40, top: 50),
                size: Size(size.width * 0.4, size.width * 0.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: buttonblueaccentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: whitecolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          onPressed: () {},
          color: buttonWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can Download',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 10),
        Icon(Icons.settings, color: whitecolor),
        SizedBox(width: 10),
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle = 0,
    this.radius = 10,
    required this.model,
    required this.margin,
    required this.size,
  });

  final DownloadModel model;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(ApiConstants.imageurl + model.posterPath!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
