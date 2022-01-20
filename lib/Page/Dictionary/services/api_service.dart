import 'package:flutter_study_jam/page/dictionary/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  //
  static const String baseURL =
      'https://api.dictionaryapi.dev/api/v2/entries/en_US/';
  static Future<DictModel> getWord(String text) async {
    final url = Uri.parse(baseURL + text);
    final respone = await http.get(url);
    var json = jsonDecode(respone.body);
    var wordDictionary = DictModel.fromJson(json[0]);
    return wordDictionary;
  }
}
