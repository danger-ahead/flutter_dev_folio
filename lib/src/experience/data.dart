import 'dart:convert';
import 'package:flutter_dev_folio/src/json_service.dart';

Future<List<List<String>>> experience() async {
  var response = jsonDecode(JSONService.json);

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
