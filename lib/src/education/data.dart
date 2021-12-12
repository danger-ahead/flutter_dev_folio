import 'package:flutter_dev_folio/src/json_service.dart';

List<List<String>> education() {
  List<List<String>> totalEducation = [];
  List<String> temp = [];

  for (var k in JSONService.response["education"].values) {
    for (var l in k.values) temp.add(l.toString());

    if (temp[5] == '') temp[5] = 'constant/education.png';
    totalEducation.add([...temp]);
    temp.clear();
  }
  return totalEducation;
}
