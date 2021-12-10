import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<List<String>>> experience() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);

  List<List<String>> totalExperience = [];
  List<String> temp = [];

  for (var k in response["experience"].values) {
    for (var l in k.values) temp.add(l.toString());

    if (temp[4] == '') temp[4] = 'constant/experience.png';
    totalExperience.add([...temp]);
    temp.clear();
  }
  return totalExperience;
}
