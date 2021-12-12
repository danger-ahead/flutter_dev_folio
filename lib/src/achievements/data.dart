import 'package:flutter_dev_folio/src/json_service.dart';

List<List<String>> achievements() {
  List<List<String>> totalAchievements = [];
  List<String> temp = [];

  for (var k in JSONService.response["achievements"].values) {
    for (var l in k.values) temp.add(l.toString());

    totalAchievements.add([...temp]);
    temp.clear();
  }
  return totalAchievements;
}
