class PeopleDetailModel {
  PeopleDetailModel({
    // required this.adult,
    // required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    // required this.homepage,
    required this.id,
    // required this.imdbId,
    // required this.knownForDepartment,
    required this.name,
    // required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  // final bool adult;
  // List<String> alsoKnownAs;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final int? gender;
  // final String? homepage;
  final int id;
  // final String? imdbId;
  // final String? knownForDepartment;
  final String? name;
  // final String? placeOfBirth;
  final num? popularity;
  final String? profilePath;

  factory PeopleDetailModel.fromJson(Map<String, dynamic> json) =>
      PeopleDetailModel(
        // adult: json["adult"],
        // alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: json["birthday"],
        deathday: json["deathday"],
        gender: json["gender"],
        // homepage: json["homepage"],
        id: json["id"],
        // imdbId: json["imdb_id"],
        // knownForDepartment: json["known_for_department"],
        name: json["name"],
        // placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"],
        profilePath: 'https://image.tmdb.org/t/p/w500' + json["profile_path"],
      );

  factory PeopleDetailModel.defaultValue() {
    return PeopleDetailModel(
      id: 0,
      // adult: false,
      // episodeRunTime: [],
      name: '',
      gender: 0,
      // homepage: '',
      biography: '',
      birthday: '',
      deathday: '',
      // imdbId: '',
      // knownForDepartment: '',
      // placeOfBirth: '',
      profilePath: '',
      popularity: 0,

      // genres: [],
      // production_companies: [],
      // production_countries: [],
      // spoken_languages: [],
    );
  }
}
