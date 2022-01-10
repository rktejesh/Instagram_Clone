import 'dart:async';
import 'dart:convert';
import 'package:authentication_repository/src/Exception/login_error.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, error }

class AuthenticationRepository {
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    Map data = {"email": username, "password": password};
    var body = json.encode(data);
    var url = Uri.parse(
        "https://rktejesh-insta-clone-backend.herokuapp.com/user/login");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);


    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body);
      saveToken(parsedJson['token']);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      final parsedJson = jsonDecode(response.body);
      throw LogInFailure(parsedJson['message']);
    }
  }

  void logOut() {
    deleteToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}