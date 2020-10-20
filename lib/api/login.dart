import 'dart:convert';
import 'package:http/http.dart' as http;

class Login {
  final String _loginurl = 'http://dev.digizigs.com/api/v1/auth/login';
  //final String _loginurl = 'http://127.0. 0.1/digizigs/api/v1/auth/login';

  getData(data) async {
    return await http.post(_loginurl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
