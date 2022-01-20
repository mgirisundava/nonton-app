class PeopleModel {
  PeopleModel({
    required this.adult,
    required this.gender,
    required this.id,
    // required this.knownForDepartement,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  final bool adult;
  final int? gender;
  final int id;
  // final String knownForDepartement;
  final String name;
  final num popularity;
  final String? profilePath;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        // knownForDepartement: json["known_for_departement"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null
            ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
            : 'https://image.tmdb.org/t/p/w500' + json['profile_path'],
      );
}
