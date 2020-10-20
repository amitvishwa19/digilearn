import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://dev.digizigs.com/api/v1/auth/";

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}

class LoginApi {
  final String _loginurl = 'http://dev.digizigs.com/api/v1/auth/login';
  //final String _loginurl = 'http://192.168.56.1/digizigs/api/v1/auth/login';

  getData(data) async {
    return await http.post(_loginurl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
