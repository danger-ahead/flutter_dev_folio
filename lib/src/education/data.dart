import 'dart:convert';
import 'package:flutter_dev_folio/src/json_service.dart';

Future<List<List<String>>> education() async {
  var response = jsonDecode(JSONService.json);

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
