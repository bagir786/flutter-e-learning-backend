import 'dart:convert';
import 'package:e_learning/data/login_response/login_response.dart';
import 'package:e_learning/data/response/course_respon/course_respon.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Apirepository {
  Future<LoginResponse> authenticate(String identifier, String password) async {
    final response = await http.post(
      // http://10.0.2.2:1337/api/auth/local
      // chrome http://127.0.0.1:1337/api/auth/local
      Uri.parse('http://10.0.2.2:1337/api/auth/local'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'identifier': identifier, 'password': password}),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to authenticate');  
    }
  }

  Future<CourseRespon> getCourses() async {
    final token = await getTokenFromPrefs();
    final response = await http.get(
      Uri.parse('http://10.0.2.2:1337/api/courses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  return CourseRespon.fromJson(data);
} else {
  throw Exception('Failed To load course');
}

  }

  Future<void> saveTokenToPrefs(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
