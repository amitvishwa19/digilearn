class Strings {
  Strings._();

  //static const baseUrl = 'http://10.0.2.2/digizigs/api/v1';
  static const baseUrl = 'http://dev.digizigs.com/api/v1';

  static const loginUrl = baseUrl + '/auth/login';
  static const userUrl = baseUrl + '/auth/user';
  static const refreshUrl = baseUrl + '/auth/refresh';
  static const updateUser = baseUrl + '/auth/user/update';

  static const version = '1.2.2';

  static const String appTitle = "DigiLearn";
  static const String introTitle =
      "We make learning easy. Join Digilearn to learn Courses for free on Digilearn.";
  static const String appUser = "Vishwa";
}
