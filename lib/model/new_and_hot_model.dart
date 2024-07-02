class NewAndHotModel {
  String? title;
  String? description;
  String? posterpath;

  NewAndHotModel(
      {required this.title,
      required this.description,
      required this.posterpath}) {
    // print("$posterpath");
  }

  factory NewAndHotModel.fromJson(Map<String, dynamic> json) {
    return NewAndHotModel(
        title: json["title"],
        description: json["overview"],
        posterpath: json["poster_path"] ??
            "https://image.tmdb.org/t/p/w500/iADOJ8Zymht2JPMoy3R7xceZprc.jpg");
  }
}
