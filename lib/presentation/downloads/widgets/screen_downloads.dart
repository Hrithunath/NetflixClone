import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatefulWidget {
  ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  late Future<List<DownloadsModel>> imagelist;

  final widgetList = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagelist = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              titile: "Downloads",
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List<String> imageList = [
    "https://media.themoviedb.org/t/p/w250_and_h141_face/9zcbqSxdsRMZWHYtyCd1nXPr2xq.jpg",
    "https://media.themoviedb.org/t/p/w250_and_h141_face/1i1N0AVRb54H6ZFPDTwbo9MLxSF.jpg",
    "https://media.themoviedb.org/t/p/w250_and_h141_face/7sqFEDDmK1hG5m92upolcfQxy7R.jpg",
  ];
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
        height,
        const Text(
          'We will download a personalised selection of \nmovies and shows for you, so there is\n always something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        height,
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
              DownloadsImageWidgets(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 170, top: 50),
                angle: 25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidgets(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 170, top: 50),
                angle: -20,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidgets(
                imageList: imageList[2],
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
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {},
          color: buttonWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what Do you can Download',
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
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        width,
        Icon(
          Icons.settings,
          color: whitecolor,
        ),
        width,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    this.angle = 0,
    this.radius = 10,
    required this.imageList,
    required this.margin,
    required this.size,
  });
  final String imageList;
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
            height: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

