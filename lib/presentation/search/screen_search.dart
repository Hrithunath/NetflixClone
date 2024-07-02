import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/model/search_model.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle..dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future<List<SearchModel>> searchIdleList;
  String searchQuery = '';
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    searchIdleList = Api().getSearchIdle();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            onChanged: (value) {
              if (debounce?.isActive ?? false) debounce?.cancel();
              debounce = Timer(const Duration(milliseconds: 700), () {
                setState(() {
                  searchQuery = value;
                });
              });
            },
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          height,
          Expanded(
            child: searchQuery.isEmpty
                ? FutureBuilder(
                    future: searchIdleList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        return SearchIdleWidget(snapshot: snapshot);
                      } else {
                        return const Center(
                          child: CircleAvatar(),
                        );
                      }
                    })
                : FutureBuilder(
                    future: Api().getSearchResult(searchQuery),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        return SearchResultWidget(snapshot: snapshot);
                      } else {
                        return const Center(
                          child: CircleAvatar(),
                        );
                      }
                    }),
          )
        ],
      ),
    )));
  }
}
