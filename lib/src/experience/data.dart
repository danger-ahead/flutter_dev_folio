import '../json_service.dart';

List<List<String>> experience() {
  final List<List<String>> totalExperience = [];
  final List<String> temp = [];

  for (final k in JSONService.response['experience'].values) {
    for (final l in k.values) temp.add(l.toString());

    if (temp[4] == '') temp[4] = 'constant/experience.png';
    totalExperience.add([...temp]);
    temp.clear();
  }
  return totalExperience;
}
