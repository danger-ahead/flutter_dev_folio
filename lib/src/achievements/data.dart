import '../json_service.dart';

List<List<String>> achievements() {
  final List<List<String>> totalAchievements = [];
  final List<String> temp = [];

  for (final k in JSONService.response['achievements'].values) {
    for (final l in k.values) temp.add(l.toString());

    totalAchievements.add([...temp]);
    temp.clear();
  }
  return totalAchievements;
}
