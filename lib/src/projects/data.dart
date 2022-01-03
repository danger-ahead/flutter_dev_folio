import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../json_service.dart';

//checking if dotenv starts with "ghp"
//https://github.blog/changelog/2021-03-31-authentication-token-format-updates-are-generally-available/#:~:text=ghp_%20for%20Personal%20Access%20Tokens

List<List<String>> projects() {
  final List<List<String>> totalProjects = [];
  final List<String> temp = [];

  for (final k in JSONService.response['projects'].values) {
    for (final l in k.values) temp.add(l.toString());

    totalProjects.add([...temp]);
    temp.clear();
  }
  return totalProjects;
}

Future<List<String>> starsAndForks(String repo) async {
  final String loadDotenv = await rootBundle.loadString('dotenv');
  final List<String> words = repo.split('/');
  http.Response response;
  if (loadDotenv.startsWith('ghp')) {
    response = await http.get(
      Uri.https('api.github.com',
          'repos/${words[words.length - 2]}/${words[words.length - 1]}'),
      headers: {
        'Authorization': 'Bearer $loadDotenv',
      },
    );
  } else {
    response = await http.get(
      Uri.https('api.github.com',
          'repos/${words[words.length - 2]}/${words[words.length - 1]}'),
    );
  }
  final information = jsonDecode(response.body);

  final List<String> starsForks = [
    information['stargazers_count'].toString(),
    information['forks'].toString()
  ];

  return starsForks;
}

Future<List<String>> github(String repo) async {
  final String loadDotenv = await rootBundle.loadString('dotenv');
  final List<String> words = repo.split('/');
  http.Response response;
  if (loadDotenv.startsWith('ghp')) {
    response = await http.get(
      Uri.https(
          'api.github.com', 'repos/danger-ahead/${words[words.length - 1]}'),
      headers: {
        'Authorization': 'Bearer $loadDotenv',
      },
    );
  } else {
    response = await http.get(
      Uri.https(
          'api.github.com', 'repos/danger-ahead/${words[words.length - 1]}'),
    );
  }
  final information = jsonDecode(response.body);

  final List<String> starsForks = [
    information['full_name']
        .toString()
        .split('/')[information['full_name'].toString().split('/').length - 1],
    information['language'].toString(),
    information['description'].toString(),
    information['stargazers_count'].toString(),
    information['forks'].toString()
  ];

  return starsForks;
}
