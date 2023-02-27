import 'package:flutter/material.dart';

import '../../../product/service/project_dio.dart';
import '../../login/view/login.dart';
import '../service/register_service.dart';
import '../view/register_view.dart';

abstract class RegisterViewModel extends State<RegisterView>
    with ProjectDioMixin {
  final RegisterService registerService = RegisterService();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;
  bool isRegistering = false;

  Future<bool> register(String email, String name, String password) async {
    return await registerService.register(email, name, password);
  }

  Future<void> registerNow() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isRegistering = true;
      });

      final success = await register(
          emailController.text, nameController.text, passwordController.text);

      setState(() {
        isRegistering = false;
      });

      if (success) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginView()));
      } else {
        // ignore: use_build_context_synchronously
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Someting went wrong, please try again "),
            contentPadding: EdgeInsets.all(20),
          ),
        );
      }
    }
  }

  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
