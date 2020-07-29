import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  Future<dynamic> fetchdata() async {
    final response = await http.get('https://reqres.in/api/users?page=2');
    String data = response.body;
    return jsonDecode(data);
  }
}
