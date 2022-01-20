import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nonton_app/models/people_detail_model.dart';

class PeopleDetailProvider with ChangeNotifier {
  final baseUrl = "https://api.themoviedb.org";
  final apiKey = "ab3a67a225bfc7da852014189004fcb5";

  Future<PeopleDetailModel> getPeopleDetail(int id) async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/person/" +
              id.toString() +
              "?api_key=ab3a67a225bfc7da852014189004fcb5&language=en-US"));

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedJson = jsonDecode(response.body);
        PeopleDetailModel peopleDetails =
            PeopleDetailModel.fromJson(parsedJson);
        return peopleDetails;
      } else {
        return PeopleDetailModel.defaultValue();
      }
    } catch (e) {
      print(e);
      return PeopleDetailModel.defaultValue();
    }
  }
}
