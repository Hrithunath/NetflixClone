import 'dart:convert';
import 'package:netflixclone/model/download_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _downloads =
      "https://api.themoviedb.org/3/trending/all/day?api_key=5cb68dace165c05d359fab2f614f406c";

  Future<List<DownloadModel>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_downloads));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body) as Map<String, dynamic>;
      final results = decodeData['results'] as List<dynamic>;
      return results.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
}
