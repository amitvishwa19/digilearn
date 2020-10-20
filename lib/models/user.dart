class User {
  final bool login;
  final String firstname;
  final String lastname;
  final String role;
  final String avatarurl;

  User(this.login, this.firstname, this.lastname, this.role, this.avatarurl);

  Map toJson() => {
        'login': login,
        'firstname': firstname,
        'lastname': lastname,
        'role': role,
        'avatarurl': avatarurl
      };

  User.fromJson(Map json)
      : login = json['statuss'],
        firstname = json['firstname'],
        lastname = json['firstname'],
        role = json['firstname'],
        avatarurl = json['firstname'];
}
