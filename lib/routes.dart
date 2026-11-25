import 'package:get/get.dart';
import 'package:carepoint/pages/splash_page.dart';
import 'package:carepoint/pages/login_page.dart';
import 'package:carepoint/pages/form_login.dart';

class Routes {
  static const splashPage = "/splashPage";
  static const loginPage = "/loginPage";
  static const loginFormPage = "/loginFormPage";

  static final myPages = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: loginFormPage, page: () => FormLogin()),
  ];
}