class DownloadModel {
  String? posterPath;

  DownloadModel({required this.posterPath});

  factory DownloadModel.fromJson(Map<String, dynamic> json) {
    return DownloadModel(
      posterPath: json["poster_path"] ??
          "https://image.tmdb.org/t/p/w500/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
    );
  }
}
