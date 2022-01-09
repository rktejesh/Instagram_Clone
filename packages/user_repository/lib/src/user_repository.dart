import 'dart:async';
import './models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  User? _user;
  Future<String?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
    return token;
  }
  Future<User?> getUser() async {
    if (_user != null) return _user;
    String? _token = await getUserData();
    return User(_token);
  }
}