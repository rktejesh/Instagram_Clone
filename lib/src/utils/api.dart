import 'dart:convert';

import 'package:http/http.dart' as http;

const String root="https://rktejesh-insta-clone-backend.herokuapp.com";
const String registration="$root/user/signup";
const String login="$root/user/login";

Future<void> main() async {
  signIn("test1@gmail.com", "test@123");
}

signIn(email,password) async {
  Map data = {
    "email": email,
    "password": password
  };
  var body = json.encode(data);
  var url = Uri.parse(login);
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  );
}
