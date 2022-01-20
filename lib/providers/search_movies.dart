import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nonton_app/models/movie/search_model.dart';

class SearchMovies with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";
  static Future<List<SearchModel>> getSearchData(String query) async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=529ae25c5cdadee493d5fe38b674e0d2&language=en-US&query=" +
            query +
            "&page=1&include_adult=false");
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List searchData = json.decode(response.body)["results"];

      return searchData
          .map((json) => SearchModel.fromJson(json))
          .where((searchData) {
        final titleLower = searchData.title!.toLowerCase();

        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
