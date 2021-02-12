import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/models/ClassroomModel.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ClassController extends GetxController {
  final userClasses = List<ClassroomModel>().obs;
  final selectedClass = 'class'.obs;
  final classModel = ClassroomModel().obs;

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

  selectClass(sClass) {
    classModel.value = sClass;
  }

  setClass(String className) {
    selectedClass(className);
  }

  //addClass(ClassModel classModel) {}

  //removeClass(ClassModel classModel) {}
}

class ClassService {
  static var client = http.Client();

  static Future<List<ClassroomModel>> fetchClass() async {
    final String _url = Strings.getClass;
    final String _token = await SharePref.getString('token');

    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };

    var response = await client.get(_url, headers: header);

    if (response.statusCode == 200) {
      return classroomModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<ClassroomModel> addClass(data) async {
    final String _url = Strings.createClass;
    final String _token = await SharePref.getString('token');
    //classModel = ClassModel.fromJson(data);
    //print(data.toString());
    return null;
  }
}
