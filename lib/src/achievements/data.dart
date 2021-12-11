import 'dart:convert';
import 'package:flutter_dev_folio/src/json_service.dart';

Future<List<List<String>>> achievements() async {
  var response = jsonDecode(JSONService.json);

  List<List<String>> totalAchievements = [];
  List<String> temp = [];

  for (var k in response["achievements"].values) {
    for (var l in k.values) temp.add(l.toString());

    totalAchievements.add([...temp]);
    temp.clear();
  }
  return totalAchievements;
}
