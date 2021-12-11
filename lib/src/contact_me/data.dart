import 'dart:convert';
import 'package:flutter_dev_folio/src/json_service.dart';

Future<List<String>> contactMe() async {
  var response = jsonDecode(JSONService.json);

  List<String> contactMeDetails = [];

  for (var k in response["contact_me"].values)
    contactMeDetails.add(k.toString());

  return contactMeDetails;
}

Future<List<String>> nameAndLink() async {
  var response = jsonDecode(JSONService.json);
  return [response["name_and_link"][0], response["name_and_link"][1]];
}

Future<String> bio() async {
  var response = jsonDecode(JSONService.json);
  return response["bio"];
}
