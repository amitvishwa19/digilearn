import 'package:get/get.dart';

class ScreenController extends GetxController {
  int page = 1;

  change(id) {
    page = id;
    update();
  }

  increment() {
    page++; //= id;
    update();
  }
}
