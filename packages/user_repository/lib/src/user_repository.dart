import 'dart:async';
import 'dart:convert';
import './models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  User? _user;
  Future<String?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = Uri.parse(
        "https://rktejesh-insta-clone-backend.herokuapp.com/user/me");
    final response = await http.get(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token.toString(),
        },
    );
    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body);
      return parsedJson['_id'];
    }
    return token;
  }
  Future<User?> getUser() async {
    if (_user != null) return _user;
    String? _token = await getUserData();
    return User(_token);
  }
}