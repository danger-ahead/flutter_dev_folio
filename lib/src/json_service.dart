import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class JSONService extends ChangeNotifier {
  static late final String json;

  init() async {
    json = await rootBundle.loadString('assets/portfolio.json');
    notifyListeners();
  }
}

JSONService jsonService = JSONService();
