import 'package:digilearn/models/classesModel.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ClassController extends GetxController {
  final userClasses = List<ClassModel>().obs;
  final selectedClass = 'class'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchClasses();
  }

  void fetchClasses() async {
    var classes = await ClassService.fetchClass();
    if (classes != null) {
      userClasses.value = classes;
    }
  }

  setClass(String className) {
    selectedClass(className);
  }

  addClass(ClassModel classModel) {}

  removeClass(ClassModel classModel) {}
}

class ClassService {
  static var client = http.Client();

  static Future<List<ClassModel>> fetchClass() async {
    print('fetch class method called');
    var response = await client.get(Strings.getClass);

    if (response.statusCode == 200) {
      return classModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
