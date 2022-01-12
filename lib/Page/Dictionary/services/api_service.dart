import 'package:flutter_study_jam/Page/Dictionary/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //
  static const String baseURL =
      'https://api.dictionaryapi.dev/api/v2/entries/en_US/';

  static Future<List<DictModel>> getword(query) async {
    final url = Uri.parse("$baseURL$query");
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<DictModel> word = dictModelFromJson(response.body);
        return word;
      } else {
        return List<DictModel>.empty();
      }
    } catch (e) {
      return List<DictModel>.empty();
    }
  }
}
