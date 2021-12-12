import 'package:flutter_dev_folio/src/json_service.dart';

List<String> contactMe() {
  List<String> contactMeDetails = [];

  for (var k in JSONService.response["contact_me"].values)
    contactMeDetails.add(k.toString());

  return contactMeDetails;
}

List<String> nameAndLink() {
  return [
    JSONService.response["name_and_link"][0],
    JSONService.response["name_and_link"][1]
  ];
}

String bio() {
  return JSONService.response["bio"];
}
