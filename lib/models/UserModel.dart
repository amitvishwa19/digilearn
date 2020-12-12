import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.mobile,
    this.avatarUrl,
    this.type,
    this.emailVerifiedAt,
    this.status,
  });

  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String mobile;
  dynamic avatarUrl;
  String type;
  dynamic emailVerifiedAt;
  int status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        avatarUrl: json["avatar_url"],
        type: json["type"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "mobile": mobile,
        "avatar_url": avatarUrl,
        "type": type,
        "email_verified_at": emailVerifiedAt,
        "status": status,
      };
}

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}