import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:weather/api/services/api_key.dart';
class ApiServices{

  Future<dynamic> get(String location) async {
    final response = await http.get(Uri.parse('${ApiKey.baseUri}&units=metric&q=${location}&appid=${ApiKey.apiKey}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);

    } else {

      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
