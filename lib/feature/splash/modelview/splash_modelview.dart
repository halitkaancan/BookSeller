import 'package:flutter/material.dart';
import 'package:mobileapp/feature/splash/view/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/service/project_dio.dart';
import '../../home/view/homeview.dart';
import '../../login/view/login.dart';

abstract class SplashModelView extends State<SplashView> with ProjectDioMixin {
  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    if (token != null) {
      // Token varsa ana sayfaya yönlendirin.
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeView(token: token)),
          (route) => route.isFirst);
    } else {
      // Token yoksa giriş sayfasına yönlendirin.
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginView()),
          (route) => route.isFirst);
    }
  }
}
