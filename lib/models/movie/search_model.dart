class SearchModel {
  SearchModel({
    // required this.adult,
    required this.backdropPath,
    // required this.genreIds,
    required this.id,
    // required this.mediaType,
    // required this.originalLanguage,
    required this.originalTitle,
    // required this.overview,
    // required this.popularity,
    required this.posterPath,
    // required this.releaseDate,
    required this.title,
    // required this.video,
    // required this.voteAverage,
    // required this.voteCount,
    // required this.firstAirDate,
    required this.name,
    // required this.originCountry,
    required this.originalName,
  });

  // bool adult;
  String? backdropPath;
  // List<int> genreIds;
  int id;
  // String mediaType;
  // OriginalLanguage originalLanguage;
  String? originalTitle;
  // String overview;
  // double popularity;
  String posterPath;
  // String releaseDate;
  String? title;
  // bool video;
  // double voteAverage;
  // int voteCount;
  // DateTime firstAirDate;
  String? name;
  // List<String> originCountry;
  String? originalName;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        // adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null
            ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
            : 'https://image.tmdb.org/t/p/w500' + json['backdrop_path'],
        // genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        // mediaType: json["media_type"],
        // originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] ?? "",
        // overview: json["overview"],
        // popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null
            ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
            : 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
        // releaseDate: json["release_date"] == null ? null : json["release_date"],
        title: json["title"] ?? "",
        // video: json["video"] == null ? null : json["video"],
        // voteAverage: json["vote_average"].toDouble(),
        // voteCount: json["vote_count"],
        // firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        name: json["name"] ?? "",
        // originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        originalName: json["original_name"] ?? "",
      );
}
