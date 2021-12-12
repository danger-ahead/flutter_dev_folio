import 'package:flutter_dev_folio/src/json_service.dart';

List<List<String>> experience() {
  List<List<String>> totalExperience = [];
  List<String> temp = [];

  for (var k in JSONService.response["experience"].values) {
    for (var l in k.values) temp.add(l.toString());

    if (temp[4] == '') temp[4] = 'constant/experience.png';
    totalExperience.add([...temp]);
    temp.clear();
  }
  return totalExperience;
}
