class SearchModel {
  String? posterPath;
  String? movieName;
  SearchModel({required this.movieName, required this.posterPath});
  factory SearchModel.fromjson(Map<String, dynamic> json) {
    return SearchModel(
      movieName: json['title'],
      posterPath: json["poster_path"] ??
          'https://image.tmdb.org/t/p/w500/iADOJ8Zymht2JPMoy3R7xceZprc.jpg',
    );
  }
}
