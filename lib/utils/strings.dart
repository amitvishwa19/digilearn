class Strings {
  Strings._();

  //static const baseUrl = 'http://10.0.2.2/digizigs/api/v1';
  static const baseUrl = 'http://dev.digizigs.com/api/v1';

  static const loginUrl = baseUrl + '/auth/login';
  static const userUrl = baseUrl + '/auth/user';
  static const refreshUrl = baseUrl + '/auth/refresh';
  static const updateUser = baseUrl + '/auth/user/update';
  static const getClass = baseUrl + '/user/classes';

  static const appSupport = 'http://dev.digizigs.com/digilearn/support';
  static const appTerms = 'http://dev.digizigs.com/digilearn/terms';
  static const appPrivacy = 'http://dev.digizigs.com/digilearn/privacy';

  static const version = '1.2.2';

  static const String appTitle = "DigiLearn";
  static const String introTitle =
      "We make learning easy. Join Digilearn to learn Courses for free on Digilearn.";
  static const String appUser = "Vishwa";

  static const pageBackgroundImage = 'assets/images/bg.png';
}
