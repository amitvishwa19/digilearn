import 'package:digilearn/services/AuthService.dart';
import 'package:digilearn/services/UserService_delete.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/models/UserModel.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  //var userModel = UserModel().obs;
  //var userData = List<User>().obs;
  Rx<UserModel> userModel = UserModel().obs;
  //final UserModel user = UserModel().obs;
  //UserModel get user =>_userModel.value;
  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    var _token = await SharePref().getString('token');
    var user = await AuthService.user(_token);
    userModel.value = user;
  }
}
