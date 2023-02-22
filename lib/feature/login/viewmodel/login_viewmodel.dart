import 'package:flutter/material.dart';

import '../../../product/service/project_dio.dart';

import '../service/login_service.dart';
import '../view/login.dart';

abstract class LoginViewModel extends State<LoginView> with ProjectDioMixin {
  String? token;

  late final ILoginService loginService;

  LoginViewModel() {
    loginService = LoginService(service);
  }

  Future<void> loginButton(String email, String password) async {
    token = await loginService.login(email, password);
  }
}
