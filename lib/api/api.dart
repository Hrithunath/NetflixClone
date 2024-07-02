import 'dart:convert';
import 'package:netflixclone/api/api.constants.dart';
import 'package:netflixclone/model/download_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/model/new_and_hot_model.dart';
import 'package:netflixclone/model/search_model.dart';

class Api {
  static const downloads =
      'https://api.themoviedb.org/3/trending/all/day?api_key=${ApiConstants.apikey}';

  static const everyonesWatching =
      'https://api.themoviedb.org/3/movie/popular?api_key=${ApiConstants.apikey}';
  static const comingSoon =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstants.apikey}';
  static const searchIdle =
      'https://api.themoviedb.org/3/trending/movie/week?api_key=${ApiConstants.apikey}';

  static const lastyearMovies =
      'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&primary_release_year=2024';
  static const tenseDramas =
      'https://api.themoviedb.org/3/tv/airing_today?api_key=${ApiConstants.apikey}';
  static const southIndianMovies =
      'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_original_language=ml';
  static const topTvShows =
      'https://api.themoviedb.org/3/discover/tv?api_key=${ApiConstants.apikey}';

  static const _fastlaughImage =
      'https://api.themoviedb.org/3/trending/all/day?api_key=${ApiConstants.apikey}';

  Future<List<DownloadModel>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(downloads));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<NewAndHotModel>> getEveryOnesWatching() async {
    final response = await http.get(Uri.parse(everyonesWatching));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => NewAndHotModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load Everyone Watching');
    }
  }

  Future<List<NewAndHotModel>> getComingSoon() async {
    final response = await http.get(Uri.parse(comingSoon));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData
          .map((movie) => NewAndHotModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load comingsoon');
    }
  }

  Future<List<SearchModel>> getSearchIdle() async {
    final response = await http.get(Uri.parse(searchIdle));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => SearchModel.fromjson(movie)).toList();
    } else {
      throw Exception('Failed to load Search');
    }
  }

  Future<List<SearchModel>> getSearchResult(String searchQuery) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$searchQuery&api_key=${ApiConstants.apikey}'));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => SearchModel.fromjson(movie)).toList();
    } else {
      throw Exception('Failed to load Search result');
    }
  }

  Future<List<DownloadModel>> getLastYearMovies() async {
    final response = await http.get(Uri.parse(lastyearMovies));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load last year Movies');
    }
  }

  Future<List<DownloadModel>> getTenseDramas() async {
    final response = await http.get(Uri.parse(tenseDramas));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Tense Dramas');
    }
  }

  Future<List<DownloadModel>> getSouthIndianMovies() async {
    final response = await http.get(Uri.parse(southIndianMovies));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load last year Movies SouthIndian Movies');
    }
  }

  Future<List<DownloadModel>> getTopTvShows() async {
    final response = await http.get(Uri.parse(topTvShows));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load Top Tv Shows');
    }
  }

  Future<List<DownloadModel>> getFastLaughImages() async {
    final response = await http.get(Uri.parse(_fastlaughImage));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadModel.fromJson(image)).toList();
    } else {
      throw Exception('Failed to load Fast & Laugh Images');
    }
  }
}
