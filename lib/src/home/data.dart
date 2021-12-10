import 'dart:convert';
import 'package:flutter/services.dart';

Future<String> about() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  return response["about"];
}

Future<String> resume() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  return response["resume_download_link"];
}

Future<String> name() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  return response["name_and_link"][0];
}

Future<List<String>> designation() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  List<String> result = [];

  for (int i = 0; i < response["designation"].toList().length; i++)
    result.add(response["designation"].toList()[i].toString());
  return result;
}

Future<List<List<String>>> socialMedia() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  List<List<String>> result = [];

  List<String> temp = [];

  for (var k in response["social_media"].keys) {
    for (int i = 0; i < response["social_media"][k].length; i++) {
      temp.add(response["social_media"][k][i]);
    }
    result.add([...temp]);
    temp.clear();
  }

  return result;
}
