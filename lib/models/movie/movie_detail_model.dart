class MovieDetailModel {
  final String? overview;
  final DateTime? releaseDate;
  final String? title;
  final bool? adult;
  final String? backdropPath;
  final String? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final int? id;
  final double? voteAverage;
  final int? voteCount;
  final bool? video;
  final double? popularity;
  final String? status;
  final int? budget;
  final Object? belongsToCollection;
  final String? imdbId;
  final String? homepage;
  final int? runtime;
  final int? revenue;
  final String? tagline;
  final List? genres;
  // List<Genres?> genres;
  // List<ProductionCompanies?> production_companies;
  // List<ProductionCountries?> production_countries;
  // List<SpokenLanguages?> spoken_languages;

  MovieDetailModel({
    this.overview,
    this.releaseDate,
    this.title,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.id,
    this.voteAverage,
    this.voteCount,
    this.video,
    this.popularity,
    this.status,
    this.budget,
    this.belongsToCollection,
    this.imdbId,
    this.homepage,
    this.runtime,
    this.revenue,
    this.tagline,
    this.genres,
    // required this.production_companies,
    // required this.genres,
    // required this.production_countries,
    // required this.spoken_languages,
  });

  factory MovieDetailModel.fromJson(json) {
    return MovieDetailModel(
      overview: json["overview"],
      releaseDate: DateTime.parse(json['release_date']),
      title: json["title"],
      adult: json["adult"],
      backdropPath: json["backdrop_path"] == null
          ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
          : 'https://image.tmdb.org/t/p/original' + json['backdrop_path'],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      posterPath: json["poster_path"] == null
          ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
          : 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
      id: json["id"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      video: json["video"],
      popularity: json["popularity"],
      status: json["status"],
      budget: json["budget"],
      belongsToCollection: json["belongs_to_collection"],
      imdbId: json["imdb_id"],
      homepage: json["homepage"],
      runtime: json["runtime"],
      revenue: json["revenue"],
      tagline: json["tagline"],
      genres: json["genres"],
      // genres: json["genres"],
      // production_companies: json["production_companies"],
      // production_countries: json["production_countries"],
      // spoken_languages: json["spoken_languages"],
    );
  }

  factory MovieDetailModel.defaultValue() {
    return MovieDetailModel(
      overview: '',
      releaseDate: DateTime.now(),
      title: '',
      adult: false,
      backdropPath: '',
      originalLanguage: '',
      originalTitle: '',
      posterPath: '',
      id: 0,
      voteAverage: 0,
      voteCount: 0,
      video: false,
      popularity: 0,
      status: '',
      budget: 0,
      belongsToCollection: '',
      imdbId: '',
      homepage: '',
      runtime: 0,
      revenue: 0,
      tagline: '',
      genres: [],
      // genres: [],
      // production_companies: [],
      // production_countries: [],
      // spoken_languages: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "overview": overview,
      "release_date": releaseDate,
      "title": title,
      "adult": adult,
      "backdrop_path": backdropPath,
      "original_language": originalLanguage,
      "original_title": originalTitle,
      "poster_path": posterPath,
      "id": id,
      "vote_average": voteAverage,
      "vote_count": voteCount,
      "video": video,
      "popularity": popularity,
      "status": status,
      "budget": budget,
      "belongs_to_collection": belongsToCollection,
      "imdb_id": imdbId,
      "homepage": homepage,
      "revenue": revenue,
      "runtime": runtime,
      "tagline": tagline,
      "genres": genres,
      // "production_companies": production_companies,
      // "production_countries": production_countries,
      // "spoken_languages": spoken_languages,
    };
  }
}

class ProductionCompanies {
  String name;
  int id;
  String? logoPath;
  String originCountry;

  ProductionCompanies({
    required this.name,
    required this.id,
    required this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompanies.fromJson(json) {
    return ProductionCompanies(
      name: json["name"],
      id: json["id"],
      originCountry: json["origin_countries"],
      logoPath: json["logo_path"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "logo_path": logoPath,
      "origin_country": originCountry,
    };
  }
}

class ProductionCountries {
  String iso_3166_1;
  String name;

  ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });

  factory ProductionCountries.fromJson(json) {
    return ProductionCountries(
      iso_3166_1: json["iso_3611_1"],
      name: json["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "iso_3166_1": iso_3166_1,
    };
  }
}

class SpokenLanguages {
  String iso_639_1;
  String name;

  SpokenLanguages({
    required this.iso_639_1,
    required this.name,
  });

  factory SpokenLanguages.fromJson(json) {
    return SpokenLanguages(
      iso_639_1: json["iso_639_1"],
      name: json["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "iso_639_1": iso_639_1,
    };
  }
}
