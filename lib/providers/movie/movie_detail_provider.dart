import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nonton_app/models/movie/movie_detail_model.dart';

class MovieDetailProvider with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";

  Future<MovieDetailModel> getMovieDetails(int id) async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/" +
              id.toString() +
              "?api_key=ab3a67a225bfc7da852014189004fcb5&language=en-US"));

      if (response.statusCode == 200) {
        Map parsedJson = jsonDecode(response.body);
        MovieDetailModel movieDetails = MovieDetailModel.fromJson(parsedJson);
        return movieDetails;
      } else {
        return MovieDetailModel.defaultValue();
      }
    } catch (e) {
      return MovieDetailModel.defaultValue();
    }
  }
}
