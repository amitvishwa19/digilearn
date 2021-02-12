// To parse this JSON data, do
//
//     final classroomModel = classroomModelFromJson(jsonString);

import 'dart:convert';

List<ClassroomModel> classroomModelFromJson(String str) =>
    List<ClassroomModel>.from(
        json.decode(str).map((x) => ClassroomModel.fromJson(x)));

String classroomModelToJson(List<ClassroomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassroomModel {
  ClassroomModel({
    this.id,
    this.code,
    this.name,
    this.description,
    this.status,
    this.user,
  });

  int id;
  String code;
  String name;
  String description;
  int status;
  User user;

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "description": description,
        "status": status,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.avatar,
    this.type,
    this.status,
  });

  String firstName;
  String lastName;
  dynamic avatar;
  String type;
  int status;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatar: json["avatar"],
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
        "type": type,
        "status": status,
      };
}
