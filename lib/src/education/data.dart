import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<List<String>>> education() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);

  List<List<String>> totalEducation = [];
  List<String> temp = [];

  for (var k in response["education"].values) {
    for (var l in k.values) temp.add(l.toString());

    if (temp[5] == '') temp[5] = 'constant/education.png';
    totalEducation.add([...temp]);
    temp.clear();
  }
  return totalEducation;
}
