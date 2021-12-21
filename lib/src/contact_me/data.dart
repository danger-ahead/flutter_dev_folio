import '../json_service.dart';

List<String> contactMe() {
  final List<String> contactMeDetails = [];

  for (final k in JSONService.response['contact_me'].values)
    contactMeDetails.add(k.toString());

  return contactMeDetails;
}

List<String> nameAndLink() {
  return [
    JSONService.response['name_and_link'][0].toString(),
    JSONService.response['name_and_link'][1].toString()
  ];
}

String bio() {
  return JSONService.response['bio'].toString();
}
