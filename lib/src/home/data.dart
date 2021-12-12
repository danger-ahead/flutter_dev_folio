import 'package:flutter_dev_folio/src/json_service.dart';

String about() {
  return JSONService.response["about"];
}

String resume() {
  return JSONService.response["resume_download_link"];
}

String name() {
  return JSONService.response["name_and_link"][0];
}

List<String> designation() {
  List<String> result = [];

  for (int i = 0; i < JSONService.response["designation"].toList().length; i++)
    result.add(JSONService.response["designation"].toList()[i].toString());
  return result;
}

List<List<String>> socialMedia() {
  List<List<String>> result = [];

  List<String> temp = [];

  for (var k in JSONService.response["social_media"].keys) {
    for (int i = 0; i < JSONService.response["social_media"][k].length; i++) {
      temp.add(JSONService.response["social_media"][k][i]);
    }
    result.add([...temp]);
    temp.clear();
  }

  return result;
}
