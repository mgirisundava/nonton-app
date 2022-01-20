import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nonton_app/models/credit_model.dart';
import 'package:nonton_app/models/review_model.dart';
import 'package:nonton_app/models/tv/tv_model.dart';

class TvProvider with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";

  // TODO : TV AIRING TODAY

  List<TvModel> _tvAiringToday = [];
  List<TvModel> get airingToday {
    return _tvAiringToday;
  }

  Future<void> fetchTvAiringToday() async {
    final url = Uri.parse(
        "$baseUrl/3/tv/airing_today?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<TvModel> _loadedTvAiringToday = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((airingTodayData) {
        _loadedTvAiringToday.add
            // (MovieModel.fromJson(popularData));
            (TvModel(
          id: airingTodayData['id'],
          posterPath: 'https://image.tmdb.org/t/p/w500' +
              airingTodayData["poster_path"],
          // backdropPath: 'https://image.tmdb.org/t/p/w500' +
          //     airingTodayData["backdrop_path"],
          // firstAirDate: DateTime.parse(airingTodayData['first_air_date']),
          name: airingTodayData['name'],
          voteAverage: airingTodayData['vote_average'],
          voteCount: airingTodayData['vote_count'],
        ));
      });

      _tvAiringToday = _loadedTvAiringToday;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : TV POPULAR

  List<TvModel> _tvPopular = [];
  List<TvModel> get tvPopular {
    return _tvPopular;
  }

  Future<void> fetchTvPopular() async {
    final url = Uri.parse(
        "$baseUrl/3/tv/popular?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<TvModel> _loadedTvPopular = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((tvPopularData) {
        _loadedTvPopular.add
            // (MovieModel.fromJson(popularData));
            (TvModel(
          id: tvPopularData['id'],
          posterPath:
              'https://image.tmdb.org/t/p/w500' + tvPopularData["poster_path"],
          // backdropPath: 'https://image.tmdb.org/t/p/w500' +
          //     tvPopularData["backdrop_path"],
          // firstAirDate: DateTime.parse(tvPopularData['first_air_date']),
          name: tvPopularData['name'],
          voteAverage: tvPopularData['vote_average'],
          voteCount: tvPopularData['vote_count'],
        ));
      });

      _tvPopular = _loadedTvPopular;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : TV TOP RATED

  List<TvModel> _tvTopRated = [];
  List<TvModel> get tvTopRated {
    return _tvTopRated;
  }

  Future<void> fetchTvTopRated() async {
    final url = Uri.parse(
        "$baseUrl/3/tv/top_rated?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<TvModel> _loadedTvTopRated = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((_tvTopRatedData) {
        _loadedTvTopRated.add
            // (MovieModel.fromJson(popularData));
            (TvModel(
          id: _tvTopRatedData['id'],
          posterPath: 'https://image.tmdb.org/t/p/w500' +
              _tvTopRatedData["poster_path"],
          // backdropPath: 'https://image.tmdb.org/t/p/w500' +
          //     _tvTopRatedData["backdrop_path"],
          // firstAirDate: DateTime.parse(_tvTopRatedData['first_air_date']),
          name: _tvTopRatedData['name'],
          voteAverage: _tvTopRatedData['vote_average'],
          voteCount: _tvTopRatedData['vote_count'],
        ));
      });

      _tvTopRated = _loadedTvTopRated;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : TV CREDITS

  List<CreditModel> _tvCast = [];
  List<CreditModel> get tvCast {
    return _tvCast;
  }

  Future<void> fetchTvCast(int id) async {
    final url = Uri.parse("https://api.themoviedb.org/3/tv/" +
        id.toString() +
        "/credits?api_key=ab3a67a225bfc7da852014189004fcb5&language=en-US");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["cast"];
      // print(extractedData);

      final List<CreditModel> _loadedTvCast = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((tvCastData) {
        _loadedTvCast.add
            // (MovieModel.fromJson(popularData));
            (
          CreditModel(
            id: tvCastData["id"],
            originalName: tvCastData["original_name"],
            adult: tvCastData["adult"],
            gender: tvCastData["gender"],
            popularity: tvCastData["popularity"],
            name: tvCastData["name"],
            character: tvCastData["character"],
            knownForDepartment: tvCastData["known_for_department"],
            profilePath: tvCastData["profile_path"] == null
                ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
                : 'https://image.tmdb.org/t/p/w500' +
                    tvCastData['profile_path'],
          ),
        );
      });

      _tvCast = _loadedTvCast;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : REVIEWS

  List<ReviewModel> _tvReviews = [];
  List<ReviewModel> get reviews {
    return _tvReviews;
  }

  Future<void> fetchTvReviews(int id) async {
    final url = Uri.parse(
        "$baseUrl/3/tv/${id.toString()}/reviews?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];
      // print(extractedData);

      final List<ReviewModel> _loadedTvReviews = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((tvReviewData) {
        _loadedTvReviews.add
            // (MovieModel.fromJson(popularData));
            (ReviewModel(
          id: tvReviewData['id'],
          author: tvReviewData['author'],
          createdAt: DateTime.parse(tvReviewData['created_at']),
          content: tvReviewData['content'],
          updatedAt: DateTime.parse(tvReviewData['updated_at']),
          url: tvReviewData['url'],
        ));
      });

      _tvReviews = _loadedTvReviews;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
