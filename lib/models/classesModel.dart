import 'dart:convert';

List<ClassModel> classModelFromJson(String str) =>
    List<ClassModel>.from(json.decode(str).map((x) => ClassModel.fromJson(x)));

String classModelToJson(List<ClassModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassModel {
  ClassModel({
    this.id,
    this.title,
    this.description,
    this.status,
    this.teacher,
  });

  String id;
  String title;
  String description;
  int status;
  Teacher teacher;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        teacher: Teacher.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "teacher": teacher.toJson(),
      };
}

class Teacher {
  Teacher({
    this.firstname,
    this.lastname,
    this.email,
    this.avatar,
  });

  String firstname;
  String lastname;
  String email;
  dynamic avatar;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "avatar": avatar,
      };
}
