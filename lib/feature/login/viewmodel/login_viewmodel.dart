import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/service/project_dio.dart';

import '../../home/view/homeview.dart';
import '../service/login_service.dart';
import '../view/login.dart';

abstract class LoginViewModel extends State<LoginView> with ProjectDioMixin {
  String? token;
  bool isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;
  void login(String email, password) {
    try {} catch (e) {
      print(e.toString());
    }
  }

  late final ILoginService loginService;

  LoginViewModel() {
    loginService = LoginService(service);
  }

  Future<void> loginButton(String email, String password) async {
    token = await loginService.login(email, password);
  }

  void initState() {
    // token buraya null geliyor
    super.initState();
  }

  void upDateSharedPreferences(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
  }

  void checkToken() async {
    if (token!.isEmpty || token == null) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          contentPadding: EdgeInsets.all(20),
        ),
      );
    } else {
      if (isChecked) {
        upDateSharedPreferences(token ?? "");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView(token: token!)),
            (route) => route.isFirst);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView(token: "token!")),
            (route) => route.isFirst);
      }
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
