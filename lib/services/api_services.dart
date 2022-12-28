import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/github_user_model.dart';

class ApiServices {
  static const baseUrl = "https://api.github.com/users/";

  Future<GithubUser> getGithubUserData(String userName) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + userName),
          headers: {
           
            'Content-Type': 'application/json',
            
            'User-Agent': 'request'});

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
