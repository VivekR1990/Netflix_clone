import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/models/movies.dart';

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse(_trendingUrl));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch trending movies: $e');
    }
  }

  Future<List<String>> getDownloadImageUrls() async {
    try {
      final response = await http.get(Uri.parse(_trendingUrl));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData
            .map((movie) => Movie.fromJson(movie).posterPath)
            .toList();
      } else {
        throw Exception('Failed to download image URLs');
      }
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }

  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  Future<List<Movie>> getTopRated() async {
    try {
      final response = await http.get(Uri.parse(_topRatedUrl));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }

  static const _upComing =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";

  Future<List<Movie>> getUpComing() async {
    try {
      final response = await http.get(Uri.parse(_upComing));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }

  static const _top10TvShowsInIndiaToday =
      "https://api.themoviedb.org/3/discover/tv?api_key=$apiKey&with_original_language=hi&sort_by=popularity.desc";

  Future<List<Movie>> getTop10TvShowsInIndiaToday() async {
    try {
      final response = await http.get(Uri.parse(_top10TvShowsInIndiaToday));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }

  static const _forSearch =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";
  Future<List<Movie>> forSearchDara() async {
    try {
      final response = await http.get(Uri.parse(_forSearch));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }

  Future<List<Movie>> searchResult(String movie) async {
    try {
      String resultApi =
          "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$movie";
      final response = await http.get(Uri.parse(resultApi));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)["results"] as List;
        return responseData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }
}
