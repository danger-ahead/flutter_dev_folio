import 'dart:convert';
import 'package:flutter_dev_folio/src/json_service.dart';

Future<List<List<String>>> whatIdo() async {
  var response = jsonDecode(JSONService.json);

  var proficiency = response["what_i_do"]["proficiency"].toList();
  var tools = response["what_i_do"]["tools"].toList();

  List<String> totalProficiency = [];
  List<String> totalTools = [];
  List<List<String>> total = [];

  for (int k = 0; k < proficiency.length; k++)
    totalProficiency.add(proficiency[k]);

  for (int k = 0; k < tools.length; k++) totalTools.add(tools[k]);

  total.add(totalProficiency);
  total.add(totalTools);

  return total;
}
