import 'package:flutter/material.dart';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/model/search_model.dart';
import 'package:netflixclone/presentation/search/widgets/tiltle.dart';

class SearchResultWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const SearchResultWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final List<SearchModel> searchResults = snapshot.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Tv'),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          children: searchResults.isEmpty
              ? [const Center(child: Text('No data found'))]
              : List.generate(searchResults.length, (index) {
                  final searchResult = searchResults[index];
                  return MainCards(
                    searchModel: searchResult,
                  );
                }),
        ))
      ],
    );
  }
}

class MainCards extends StatelessWidget {
  final SearchModel searchModel;
  const MainCards({
    super.key,
    required this.searchModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:
                NetworkImage(ApiConstants.imageurl + searchModel.posterPath!),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
