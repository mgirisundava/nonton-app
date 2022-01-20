import 'package:flutter/material.dart';

class MovieModel with ChangeNotifier {
  // final bool adult;
  // final String backdropPath;
  // final List genreIds;
  final int? id;
  // final String originalLanguage;
  // final String originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  // final bool video;
  final num? voteAverage;
  final int? voteCount;
  final String? backdropPath;
  // bool isBookmark;

  MovieModel({
    this.id,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.backdropPath,
    // this.isBookmark = false,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json["poster_path"] == null
          ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
          : 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
      releaseDate: DateTime.parse(json["release_date"]),
      title: json['title'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      backdropPath: json["backdrop_path"] == null
          ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
          : 'https://image.tmdb.org/t/p/original' + json['backdrop_path'],
    );
  }
}
