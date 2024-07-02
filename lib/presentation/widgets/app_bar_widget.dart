import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.titile, required String title});
  final String titile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text('Downloads',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
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
    );
  }
}
