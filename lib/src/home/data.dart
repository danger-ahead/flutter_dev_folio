import '../json_service.dart';

String about() {
  return JSONService.response['about'].toString();
}

String resume() {
  return JSONService.response['resume_download_link'].toString();
}

String name() {
  return JSONService.response['name_and_link'][0].toString();
}

List<String> designation() {
  final List<String> result = [];

  for (int i = 0;
      i <
          int.parse(
              JSONService.response['designation'].toList().length.toString());
      i++)
    result.add(JSONService.response['designation'].toList()[i].toString());
  return result;
}

List<List<String>> socialMedia() {
  final List<List<String>> result = [];

  final List<String> temp = [];

  for (final k in JSONService.response['social_media'].keys) {
    for (int i = 0;
        i <
            int.parse(
                JSONService.response['social_media'][k].length.toString());
        i++) {
      temp.add(JSONService.response['social_media'][k][i].toString());
    }
    result.add([...temp]);
    temp.clear();
  }

  return result;
}
