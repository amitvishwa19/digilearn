import 'package:digilearn/models/User.dart';
import 'package:digilearn/requests/LoginRequest.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  User user;
  String errorMessage;
  bool loading = false;

  Future<bool> login(data) async {
    setLoading(true);

    APILogin().getData(data);
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }
}
