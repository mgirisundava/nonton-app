import 'package:flutter/cupertino.dart';

class TvModel with ChangeNotifier {
  // final String backdropPath;
  // final DateTime firstAirDate;
  // final List<int> genreIds;
  final int id;
  final String name;
  // final List<String> originCountry;
  // final String originalLanguage;
  // final String originalName;
  // final String overview;
  // final double popularity;
  final String posterPath;
  final num voteAverage;
  final int voteCount;

  TvModel({
    // required this.backdropPath,
    // required this.firstAirDate,
    // required this.genreIds,
    required this.id,
    required this.name,
    // required this.originCountry,
    // required this.originalLanguage,
    // required this.originalName,
    // required this.overview,
    // required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        // backdropPath: json["backdrop_path"],
        // firstAirDate: json["first_air_date"],
        // genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        // originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        // originalLanguage: json["original_language"],
        // originalName: json["original_name"],
        // overview: json["overview"],
        // popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
