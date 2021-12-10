import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<String>> contactMe() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);

  List<String> contactMeDetails = [];

  for (var k in response["contact_me"].values)
    contactMeDetails.add(k.toString());

  return contactMeDetails;
}

Future<List<String>> nameAndLink() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  return [response["name_and_link"][0], response["name_and_link"][1]];
}

Future<String> bio() async {
  String loadJSON = await rootBundle.loadString('assets/portfolio.json');
  var response = jsonDecode(loadJSON);
  return response["bio"];
}
