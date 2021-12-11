import 'dart:convert';
import 'package:flutter_dev_folio/src/json_service.dart';

Future<String> about() async {
  var response = jsonDecode(JSONService.json);
  return response["about"];
}

Future<String> resume() async {
  var response = jsonDecode(JSONService.json);
  return response["resume_download_link"];
}

Future<String> name() async {
  var response = jsonDecode(JSONService.json);
  return response["name_and_link"][0];
}

Future<List<String>> designation() async {
  var response = jsonDecode(JSONService.json);
  List<String> result = [];

  for (int i = 0; i < response["designation"].toList().length; i++)
    result.add(response["designation"].toList()[i].toString());
  return result;
}

Future<List<List<String>>> socialMedia() async {
  var response = jsonDecode(JSONService.json);
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
