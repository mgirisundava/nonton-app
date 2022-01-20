import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nonton_app/models/tv/tv_detail_model.dart';

class TvDetailProvider with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";

  Future<TvDetailModel> getTvDetails(int id) async {
    try {
      var response = await http.get(
        Uri.parse("https://api.themoviedb.org/3/tv/" +
            id.toString() +
            "?api_key=ab3a67a225bfc7da852014189004fcb5&language=en-US"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedJson = jsonDecode(response.body);
        TvDetailModel tvDetails = TvDetailModel.fromJson(parsedJson);
        return tvDetails;
      } else {
        return TvDetailModel.defaultValue();
      }
    } catch (e) {
      return TvDetailModel.defaultValue();
    }
  }
}
