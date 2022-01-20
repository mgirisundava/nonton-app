import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nonton_app/models/people_model.dart';
import 'package:http/http.dart' as http;

class PeopleProvider with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";

  List<PeopleModel> _popularPeople = [];
  List<PeopleModel> get popularPeople {
    return _popularPeople;
  }

  Future<void> fetchPopularPeople() async {
    final url = Uri.parse(
        "$baseUrl/3/person/popular?api_key=$apiKey&language=en-US&page=1");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<PeopleModel> _loadedPopularPeople = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((popularPeopleData) {
        _loadedPopularPeople.add
            // (PeopleModel.fromJson(popularPeopleData));
            (PeopleModel(
          id: popularPeopleData["id"],
          gender: popularPeopleData["gender"],
          popularity: popularPeopleData["popularity"],
          profilePath: popularPeopleData["profile_path"] == null
              ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
              : 'https://image.tmdb.org/t/p/w500' +
                  popularPeopleData['profile_path'],
          adult: popularPeopleData['adult'],
          // knownForDepartement: popularPeopleData["known_for_departement"],
          name: popularPeopleData["name"],
        ));
      });

      _popularPeople = _loadedPopularPeople;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // TODO : TRENDING PEOPLE

  List<PeopleModel> _trendingPeople = [];
  List<PeopleModel> get trendingPeople {
    return _trendingPeople;
  }

  Future<void> fetchTrendingPeople() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/trending/person/day?api_key=ab3a67a225bfc7da852014189004fcb5");
    try {
      final response = await http.get(url);
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>)["results"];

      final List<PeopleModel> _loadedTrendingPeople = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((popularPeopleData) {
        _loadedTrendingPeople.add
            // (PeopleModel.fromJson(popularPeopleData));
            (PeopleModel(
          id: popularPeopleData["id"],
          gender: popularPeopleData["gender"],
          popularity: popularPeopleData["popularity"],
          profilePath: popularPeopleData["profile_path"] == null
              ? "https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"
              : 'https://image.tmdb.org/t/p/w500' +
                  popularPeopleData['profile_path'],
          adult: popularPeopleData['adult'],
          // knownForDepartement: popularPeopleData["known_for_departement"],
          name: popularPeopleData["name"],
        ));
      });

      _trendingPeople = _loadedTrendingPeople;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
