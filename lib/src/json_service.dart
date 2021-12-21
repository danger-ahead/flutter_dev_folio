import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class JSONService extends ChangeNotifier {
  static late final String json;
  static late final response;
  static bool hasLoaded = false;

  init() async {
    json = await rootBundle.loadString('assets/portfolio.json');
    response = jsonDecode(json);
    hasLoaded = true;
    notifyListeners();
  }
}

JSONService jsonService = JSONService();
