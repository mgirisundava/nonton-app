import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nonton_app/models/credit_model.dart';
import 'package:nonton_app/models/movie/movie_model.dart';
import 'package:nonton_app/models/review_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";

  List<MovieModel> _popularMovies = [];
  List<MovieModel> get populars {
    return _popularMovies;
  }

  Future<void> fetchPopularMovies() async {
    final url = Uri.parse(
        "$baseUrl/3/movie/popular?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<MovieModel> _loadedPopular = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((popularData) {
        _loadedPopular.add
            // (MovieModel.fromJson(popularData));
            (MovieModel(
          id: popularData["id"],
          overview: popularData["overview"],
          popularity: popularData["popularity"],
          posterPath:
              'https://image.tmdb.org/t/p/w500' + popularData["poster_path"],
          releaseDate: DateTime.parse(
            popularData['release_date'],
          ),
          title: popularData["title"],
          voteAverage: popularData["vote_average"],
          voteCount: popularData["vote_count"],
          backdropPath: popularData["backdrop_path"],
        ));
      });

      _popularMovies = _loadedPopular;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // MovieModel findById(id) {
  //   return populars.firstWhere(
  //     (popularsId) => popularsId.id == id,
  //   );
  // }

// TODO: UPCOMING MOVIE

  List<MovieModel> _upcomingMovies = [];
  List<MovieModel> get upcomings {
    return _upcomingMovies;
  }

  Future<void> fethUpcomingMovies() async {
    final url = Uri.parse(
        "$baseUrl/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];
      // print(extractedData);

      final List<MovieModel> _loadedUpcoming = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((upcomingData) {
        _loadedUpcoming.add
            // (MovieModel.fromJson(popularData));
            (MovieModel(
          id: upcomingData["id"],
          overview: upcomingData["overview"],
          popularity: upcomingData["popularity"],
          posterPath:
              'https://image.tmdb.org/t/p/w500' + upcomingData["poster_path"],
          releaseDate: DateTime.parse(
            upcomingData['release_date'],
          ),
          title: upcomingData["title"],
          voteAverage: upcomingData["vote_average"],
          voteCount: upcomingData["vote_count"],
          backdropPath: upcomingData["backdrop_path"],
        ));
      });

      _upcomingMovies = _loadedUpcoming;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : NOW PLAYING MOVIES

  List<MovieModel> _nowPlayingMovies = [];
  List<MovieModel> get nowPlayingMovies {
    return _nowPlayingMovies;
  }

  Future<void> fetchNowPlayingMovies() async {
    final url = Uri.parse(
        "$baseUrl/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];
      // print(extractedData);

      final List<MovieModel> _loadedNowPlayingMovies = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((nowPlayingMovieData) {
        _loadedNowPlayingMovies.add
            // (MovieModel.fromJson(popularData));
            (MovieModel(
          id: nowPlayingMovieData["id"],
          overview: nowPlayingMovieData["overview"],
          popularity: nowPlayingMovieData["popularity"],
          posterPath: 'https://image.tmdb.org/t/p/w500' +
              nowPlayingMovieData["poster_path"],
          releaseDate: DateTime.parse(
            nowPlayingMovieData['release_date'],
          ),
          title: nowPlayingMovieData["title"],
          voteAverage: nowPlayingMovieData["vote_average"],
          voteCount: nowPlayingMovieData["vote_count"],
          backdropPath: nowPlayingMovieData["backdrop_path"],
        ));
      });

      _nowPlayingMovies = _loadedNowPlayingMovies;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : NOW PLAYING MOVIES

  List<MovieModel> _topRatedMovies = [];
  List<MovieModel> get topRatedMovies {
    return _topRatedMovies;
  }

  Future<void> fetchTopRatedMovies() async {
    final url = Uri.parse(
        "$baseUrl/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];
      // print(extractedData);

      final List<MovieModel> _loadedTopRatedMovies = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((topRatedMovieData) {
        _loadedTopRatedMovies.add
            // (MovieModel.fromJson(popularData));
            (MovieModel(
          id: topRatedMovieData["id"],
          overview: topRatedMovieData["overview"],
          popularity: topRatedMovieData["popularity"],
          posterPath: 'https://image.tmdb.org/t/p/w500' +
              topRatedMovieData["poster_path"],
          releaseDate: DateTime.parse(
            topRatedMovieData['release_date'],
          ),
          title: topRatedMovieData["title"],
          voteAverage: topRatedMovieData["vote_average"],
          voteCount: topRatedMovieData["vote_count"],
          backdropPath: topRatedMovieData["backdrop_path"],
        ));
      });

      _topRatedMovies = _loadedTopRatedMovies;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : SIMILIAR MOVIES

  List<MovieModel> _similiarMovies = [];
  List<MovieModel> get similiarMovies {
    return _similiarMovies;
  }

  Future<void> fetchSimiliarMovies(int id) async {
    final url = Uri.parse(
        "$baseUrl/3/movie/${id.toString()}/similar?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<MovieModel> _loadedSimiliar = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((similiarMoviesData) {
        _loadedSimiliar.add
            // (MovieModel.fromJson(popularData));
            (MovieModel(
          id: similiarMoviesData["id"],
          overview: similiarMoviesData["overview"],
          popularity: similiarMoviesData["popularity"],
          posterPath: similiarMoviesData["poster_path"] == null
              ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
              : 'https://image.tmdb.org/t/p/w500' +
                  similiarMoviesData["poster_path"],
          releaseDate: DateTime.parse(
            similiarMoviesData['release_date'],
          ),
          title: similiarMoviesData["title"],
          voteAverage: similiarMoviesData["vote_average"],
          voteCount: similiarMoviesData["vote_count"],
          backdropPath: similiarMoviesData["backdrop_path"] == null
              ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
              : 'https://image.tmdb.org/t/p/w500' +
                  similiarMoviesData["backdrop_path"],
        ));
      });

      _similiarMovies = _loadedSimiliar;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : MOVIE CREDITS

  List<CreditModel> _movieCast = [];
  List<CreditModel> get movieCast {
    return _movieCast;
  }

  Future<void> fetchMovieCast(int id) async {
    final url = Uri.parse("https://api.themoviedb.org/3/movie/" +
        id.toString() +
        "/credits?api_key=ab3a67a225bfc7da852014189004fcb5&language=en-US");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["cast"];
      // print(extractedData);

      final List<CreditModel> _loadedMovieCast = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((movieCastData) {
        _loadedMovieCast.add
            // (MovieModel.fromJson(popularData));
            (CreditModel(
          id: movieCastData["id"],
          originalName: movieCastData["original_name"],
          adult: movieCastData["adult"],
          gender: movieCastData["gender"],
          popularity: movieCastData["popularity"],
          knownForDepartment: movieCastData["known_for_department"],
          name: movieCastData["name"],
          character: movieCastData["character"],
          profilePath: movieCastData["profile_path"] == null
              ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
              : 'https://image.tmdb.org/t/p/w500' +
                  movieCastData['profile_path'],
        ));
      });

      _movieCast = _loadedMovieCast;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : REVIEWS

  List<ReviewModel> _movieReview = [];
  List<ReviewModel> get reviews {
    return _movieReview;
  }

  Future<void> fetchMovieReviews(int id) async {
    final url = Uri.parse(
        "$baseUrl/3/movie/${id.toString()}/reviews?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];
      // print(extractedData);

      final List<ReviewModel> _loadedMovieReviews = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((movieReviewData) {
        _loadedMovieReviews.add
            // (MovieModel.fromJson(popularData));
            (ReviewModel(
          id: movieReviewData['id'],
          author: movieReviewData['author'],
          createdAt: DateTime.parse(movieReviewData['created_at']),
          content: movieReviewData['content'],
          updatedAt: DateTime.parse(movieReviewData['updated_at']),
          url: movieReviewData['url'],
        ));
      });

      _movieReview = _loadedMovieReviews;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
