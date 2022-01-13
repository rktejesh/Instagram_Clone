import 'dart:async';
import 'dart:convert';
import 'package:instagram/src/models/user/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProfileRepository {
  UserProfile? _user;
  Future<UserProfile?> getUserProfileData() async {
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
      return UserProfile.fromJson(parsedJson);
    }
  }


  Future<UserProfile?> getUserProfile() async {
    if (_user != null) return _user;
    UserProfile? _userProfile = await getUserProfileData();
    return _userProfile;
  }
}