import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/github_user_model.dart';

class ApiServices {
  static const baseUrl = "https://api.github.com/users/";
  static const authToken = "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";
  // use your own auth token haiu mero use nagarw ani yesto api key haru xuttai safe ma rakhna aprxa haii version control ma najani tarika ley
  

  Future<GithubUser> getGithubUserData(String userName) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + userName), headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Content-Type': 'application/json',
        'User-Agent': 'request',
        'Authorization': 'Bearer $authToken',
        // auth token
      });

      print(response.headers);
      print("The stsus code is ${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        return GithubUser.fromJson(jsonData);
      }
      return GithubUser();
    } catch (e) {
      print(e.toString());
      return GithubUser();
    }
  }
}
