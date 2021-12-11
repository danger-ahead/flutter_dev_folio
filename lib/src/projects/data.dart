import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dev_folio/src/json_service.dart';
import 'package:http/http.dart' as http;

//checking if dotenv starts with "ghp"
//https://github.blog/changelog/2021-03-31-authentication-token-format-updates-are-generally-available/#:~:text=ghp_%20for%20Personal%20Access%20Tokens

Future<List<List<String>>> projects() async {
  // String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(JSONService.json);

  List<List<String>> totalProjects = [];
  List<String> temp = [];

  for (var k in response["projects"].values) {
    for (var l in k.values) temp.add(l.toString());

    totalProjects.add([...temp]);
    temp.clear();
  }
  return totalProjects;
}

Future<List<String>> starsAndForks(String repo) async {
  String loadDotenv = await rootBundle.loadString('dotenv');
  List<String> words = repo.split("/");
  var response;
  if (loadDotenv.startsWith("ghp")) {
    response = await http.get(
      Uri.https(
          'api.github.com', 'repos/danger-ahead/' + words[words.length - 1]),
      headers: {
        'Authorization': 'Bearer ' + loadDotenv,
      },
    );
  } else {
    response = await http.get(
      Uri.https(
          'api.github.com', 'repos/danger-ahead/' + words[words.length - 1]),
    );
  }
  var information = jsonDecode(response.body);

  List<String> starsForks = [
    information["stargazers_count"].toString(),
    information["forks"].toString()
  ];

  return starsForks;
}

Future<List<String>> github(String repo) async {
  String loadDotenv = await rootBundle.loadString('dotenv');
  List<String> words = repo.split("/");
  var response;
  if (loadDotenv.startsWith("ghp")) {
    response = await http.get(
      Uri.https(
          'api.github.com', 'repos/danger-ahead/' + words[words.length - 1]),
      headers: {
        'Authorization': 'Bearer ' + loadDotenv,
      },
    );
  } else {
    response = await http.get(
      Uri.https(
          'api.github.com', 'repos/danger-ahead/' + words[words.length - 1]),
    );
  }
  var information = jsonDecode(response.body);

  List<String> starsForks = [
    information["full_name"]
        .toString()
        .split("/")[information["full_name"].toString().split("/").length - 1],
    information["language"].toString(),
    information["description"].toString(),
    information["stargazers_count"].toString(),
    information["forks"].toString()
  ];

  return starsForks;
}
