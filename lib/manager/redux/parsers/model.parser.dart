import 'package:flutter/foundation.dart';

class ModelParser {
  const ModelParser();

  //todo: change the type of list
  Future<List<dynamic>> parseModelsInBackground(
      List<Map<String, dynamic>> list) {
    // compute spawns an isolate, runs a callback on that isolate, and returns a Future with the result
    return compute(_decodeAndParseModelsJson, list);
  }

  //todo: change the type of list
  List<dynamic> _decodeAndParseModelsJson(List<Map<String, dynamic>> data) {
    return [];
  }
}
