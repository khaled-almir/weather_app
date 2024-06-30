import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:weather/api/services/api_key.dart';
class ApiServices{

  Future<dynamic> get() async {
    final response = await http.get(Uri.parse('${ApiKey.baseUri}q=beirut&appid=${ApiKey.apiKey}'));
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return json.decode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
