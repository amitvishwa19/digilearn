class Strings {
  Strings._();

  //static const baseUrl = 'http://10.0.2.2/digizigs/api/v1';
  //static const baseUrl = 'https://dev.digizigs.com/api/v1';

  //static const baseUrl = 'http://10.0.2.2/devlomatixapi/v1';
  static const baseUrl = 'https://api.devlomatix.com/v1';

  static const loginUrl = baseUrl + '/auth/login';
  static const userUrl = baseUrl + '/auth/user';
  static const refreshUrl = baseUrl + '/auth/refresh';
  static const updateUser = baseUrl + '/auth/user/update';
  static const getClass = baseUrl + '/user/classroom';
  static const createClass = baseUrl + '/user/classrooms/create';

  static const appSupport = 'https://dev.digizigs.com/digilearn/support';
  static const appTerms = 'https://dev.digizigs.com/digilearn/terms';
  static const appPrivacy = 'https://dev.digizigs.com/digilearn/privacy';

  static const version = '1.2.6';

  static const String appTitle = "DigiLearn";
  static const String introTitle =
      "We make learning easy. Join Digilearn to learn Courses for free on Digilearn.";
  static const String appUser = "Vishwa";

  static const pageBackgroundImage = 'assets/images/bg.png';
}
