class TvDetailModel {
  TvDetailModel({
    required this.backdropPath,
    // required this.createdBy,
    // required this.episodeRunTime,
    required this.firstAirDate,
    // required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    // required this.languages,
    required this.lastAirDate,
    // required this.lastEpisodeToAir,
    required this.name,
    // required this.nextEpisodeToAir,
    // required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    // required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    // required this.productionCompanies,
    // required this.productionCountries,
    // required this.seasons,
    // required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  //  final   List<CreatedBy> createdBy;
  // final List<int> episodeRunTime;
  final DateTime firstAirDate;
  //  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  // final List<String> languages;
  final DateTime lastAirDate;
  //  final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  // final dynamic nextEpisodeToAir;
  //  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  // final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final num popularity;
  final String? posterPath;
  //  final List<Network> productionCompanies;
  //  final List<ProductionCountry> productionCountries;
  //  final List<Season> seasons;
  //  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final num voteAverage;
  final int voteCount;

  factory TvDetailModel.fromJson(Map<String, dynamic> json) => TvDetailModel(
        backdropPath:
            'https://image.tmdb.org/t/p/original' + json['backdrop_path'],
        // createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
        // episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        // genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        // languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        // lastEpisodeToAir: LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        // nextEpisodeToAir: json["next_episode_to_air"],
        // networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        // originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: 'https://image.tmdb.org/t/p/original' + json["poster_path"],
        // productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
        // productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        // seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        // spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

  factory TvDetailModel.noBackdropPath(Map<String, dynamic> json) =>
      TvDetailModel(
        backdropPath:
            'https://image.tmdb.org/t/p/original' + json['poster_path'],
        // createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
        // episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        // genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        // languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        // lastEpisodeToAir: LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        // nextEpisodeToAir: json["next_episode_to_air"],
        // networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        // originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: 'https://image.tmdb.org/t/p/original' + json["poster_path"],
        // productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
        // productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        // seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        // spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );
  factory TvDetailModel.defaultValue() {
    return TvDetailModel(
      overview: '',
      firstAirDate: DateTime.now(),
      // episodeRunTime: [],
      name: '',
      inProduction: false,
      backdropPath: '',
      originalLanguage: '',
      lastAirDate: DateTime.now(),
      posterPath: '',
      id: 0,
      voteAverage: 0,
      voteCount: 0,
      homepage: '',
      popularity: 0,
      status: '',
      numberOfEpisodes: 0,
      numberOfSeasons: 0,
      originalName: '',
      tagline: '',
      type: "",

      // genres: [],
      // production_companies: [],
      // production_countries: [],
      // spoken_languages: [],
    );
  }
}
