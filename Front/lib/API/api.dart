import 'dart:convert';
import 'package:http/http.dart' as http;

Future createUser(username, email, password) async {
  http.Response response = await http.post(
    "https://thinkwatch.herokuapp.com/user",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": username,
      "email": email,
      "password": password
    }),
  );
  return response.statusCode;
}

Future checkUser(username, password) async {
  String url =
      "https://thinkwatch.herokuapp.com/password/" + username + "/" + password;
  http.Response response = await http.get(url);
  return response.statusCode;
}
