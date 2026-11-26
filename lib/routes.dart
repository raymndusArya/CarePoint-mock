import 'package:get/get.dart';
import 'package:carepoint/pages/splash_page.dart';
import 'package:carepoint/pages/login_page.dart';
import 'package:carepoint/pages/form_login.dart';
import 'package:carepoint/pages/home_page.dart';  
import 'package:carepoint/pages/notification_page.dart';      

class Routes {
  static const splashPage = "/splashPage";
  static const loginPage = "/loginPage";
  static const loginFormPage = "/loginFormPage";
  static const homePage = "/homePage";    
  static const notificationPage = "/notification";                  

  static final myPages = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: loginFormPage, page: () => FormLogin()),
    GetPage(name: homePage, page: () => HomePage()),       
    GetPage(name: notificationPage, page: () => NotificationPage()),

    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      transition: Transition.fadeIn, // Efek memudar halus (sangat cocok untuk splash)
      transitionDuration: Duration(milliseconds: 800), // Durasi animasi
    ),

    
  ];
}