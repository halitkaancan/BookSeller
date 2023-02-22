import 'package:flutter/material.dart';

import '../../../product/service/project_dio.dart';
import '../service/register_service.dart';
import '../view/register_view.dart';

abstract class RegisterViewModel extends State<RegisterView>
    with ProjectDioMixin {
  final RegisterService registerService = RegisterService();

  Future<bool> register(String email, String name, String password) async {
    return await registerService.register(email, name, password);
  }
}
