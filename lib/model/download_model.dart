import 'package:flutter/foundation.dart';

class DownloadModel {
  String? posterpath;

  DownloadModel({required this.posterpath});

  factory DownloadModel.fromJson(Map<String, dynamic> Json) {
    return DownloadModel(posterpath: Json["poster_path"] ?? "https://image.tmdb.org/t/p/w500/iADOJ8Zymht2JPMoy3R7xceZprc.jpg");
  }
}
