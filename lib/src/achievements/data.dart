import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<List<String>>> achievements() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);

  List<List<String>> totalAchievements = [];
  List<String> temp = [];

  for (var k in response["achievements"].values) {
    for (var l in k.values) temp.add(l.toString());

    totalAchievements.add([...temp]);
    temp.clear();
  }
  return totalAchievements;
}
